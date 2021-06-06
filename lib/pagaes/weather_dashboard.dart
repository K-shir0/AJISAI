import 'dart:convert';

import 'package:ajisai/pagaes/common/background_container.dart';
import 'package:ajisai/providers/weather.dart';
import 'package:ajisai/providers/weather_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'common/glass_box.dart';

final weatherStateNotifier =
    StateNotifierProvider<WeatherStateNotifier, WeatherState>(
  (refs) => WeatherStateNotifier(),
);

class WeatherDashboardPage extends HookWidget {
  final testJson = '''
  [
  {"_id":"60ae4f00916286ba94583a7d","altitude":18,"createdat":"2021-05-26T22:37:04.563+09:00","humidity":102400,"pressure":25905076,"rain":0.077,"soilmoisture":373,"soiltemperature":-6,"temperature":2267,"updatedat":"2021-05-26T22:37:04.563+09:00","winddirection":"NE","windspeed":0},
  {"_id":"60ae4f00916286ba94583a7d","altitude":18,"createdat":"2021-05-26T22:37:04.563+09:00","humidity":102400,"pressure":25905076,"rain":0.000,"soilmoisture":373,"soiltemperature":-6,"temperature":2267,"updatedat":"2021-05-26T22:37:04.563+09:00","winddirection":"NE","windspeed":0}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(weatherStateNotifier);

    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Future<WeatherState?> fetchData(Dio dio) async {
          try {
            // final response = await dio.get('file:///Users/k-shiro/Downloads/1h-recent.json');
            final file = await rootBundle.loadString('1h-recent.json');
            return WeatherState.fromJson({'weathers': jsonDecode(file)});
          } catch (e) {
            print(e);
          }
        }

        final dio = Dio();

        fetchData(dio).then((value) => context
            .read(weatherStateNotifier.notifier)
            .setState(value!.weathers));
      });
    }, []);

    // 一番新しいデータ
    final Weather? latestData =
        provider.weathers.isNotEmpty ? provider.weathers.first : null;

    final Weather? oldestData =
        provider.weathers.isNotEmpty ? provider.weathers.last : null;

    double? rain1hRecent;

    if (latestData != null && oldestData != null) {
      if (latestData.rain != null && oldestData.rain != null) {
        rain1hRecent = (latestData.rain! - oldestData.rain!) * 25.4;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(),
          ResponsiveGridRow(children: [
            ResponsiveGridCol(
              lg: 2,
              child: Container(),
            ),
            /*
             * 列要素
             */
            ResponsiveGridCol(
              lg: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResponsiveGridRow(
                  children: [
                    /*
                     * 行要素
                     */
                    ResponsiveGridCol(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "AJISAI",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    topInformationFrame(
                      GlassBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: topInformation(latestData, rain1hRecent),
                        ),
                      ),
                    ),
                    // 気温のグラフ
                    ResponsiveGridCol(
                        child: ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                          xl: 3,
                          child: GlassBox(
                            child: Container(
                              height: 500,
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  ResponsiveGridCol topInformationFrame(Widget child) {
    return ResponsiveGridCol(
      child: Padding(padding: const EdgeInsets.all(4.0), child: child),
    );
  }

  Widget topInformation(Weather? weather, double? rain) {
    final String temperature =
        weather?.getTemperature()?.round().toString() ?? "-- "; // 気温
    final String humidity = weather?.getHumidity()?.toString() ?? "-- "; // 湿度
    final String hectopascal =
        weather?.getHectopascal()?.toString() ?? "-- "; // 気圧
    final String windSpeed = weather?.getWindSpeed()?.toString() ?? "-- "; // 風速
    final String windDirection = weather?.windDirection ?? "--"; // 風向

    // 風向の矢印を決定するメソッド
    IconData windDirectionArrow(String? windDirection) {
      switch (windDirection) {
        case "E":
          return MaterialCommunityIcons.arrow_right;
        case "N":
          return MaterialCommunityIcons.arrow_up;
        case "NE":
          return MaterialCommunityIcons.arrow_top_right;
        case "NW":
          return MaterialCommunityIcons.arrow_top_left;
        case "S":
          return MaterialCommunityIcons.arrow_down;
        case "SE":
          return MaterialCommunityIcons.arrow_bottom_right;
        case "SW":
          return MaterialCommunityIcons.arrow_bottom_left;
        case "W":
          return MaterialCommunityIcons.arrow_left;

        default:
          return Icons.help_outline;
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5:13 JST時点",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 18),
                ),
                // 気温
                Text("$temperature°",
                    style: const TextStyle(color: Colors.white, fontSize: 64)),
                const Text("晴れ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            /*
             * 晴れとか曇りとか
             */
            SvgPicture.asset(
              "svg/cloudy.svg",
              height: 96,
            ),
          ],
        ),
        // ここからサブインフォ
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ResponsiveGridRow(children: [
            ResponsiveGridCol(xs: 1, child: Container()),
            miniInfo(MaterialCommunityIcons.water_outline, "湿度", "$humidity%"),
            miniInfo(MaterialCommunityIcons.gauge, "気圧", "${hectopascal}hPa"),
            miniInfo(
                MaterialCommunityIcons.weather_windy, "風速", "${windSpeed}m/s"),
            miniInfo(windDirectionArrow(weather?.windDirection), "風向",
                windDirection),
            miniInfo(MaterialCommunityIcons.cup, "雨量",
                "${rain?.toStringAsFixed(1) ?? "-- "}mm/1h"),
          ]),
        )
      ],
    );
  }

  ResponsiveGridCol miniInfo(IconData iconData, String title, String text) {
    return ResponsiveGridCol(
      xs: 2,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 40,
            color: Colors.white,
          ),
          Text(title,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
