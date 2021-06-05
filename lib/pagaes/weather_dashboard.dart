import 'dart:convert';

import 'package:ajisai/providers/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_grid/responsive_grid.dart';

class WeatherDashboardPage extends HookWidget {
  final weatherStateNotifier =
      StateNotifierProvider<WeatherStateNotifier, WeatherState>(
    (refs) => WeatherStateNotifier(),
  );

  final testJson = '''
  [{"_id":"60ae4f00916286ba94583a7d","altitude":18,"createdat":"2021-05-26T22:37:04.563+09:00","humidity":102400,"pressure":25905076,"rain":0.077,"soilmoisture":373,"soiltemperature":-6,"temperature":2267,"updatedat":"2021-05-26T22:37:04.563+09:00","winddirection":"NE","windspeed":0}]
  ''';

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // ignore: prefer_function_declarations_over_variables
      final test = () async {
        try {
          // final dio = Dio();
          // final response = await dio.get('http://localhost:1323/weathers');
          final a = WeatherState.fromJson({'weathers': jsonDecode(testJson)});
        } catch (e) {
          print(e);
        }
      };

      test();
    }, []);

    final provider = useProvider(weatherStateNotifier);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color(0xff2980B9).withOpacity(0.6),
                  const Color(0xff6DD5FA).withOpacity(0.6),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
          ResponsiveGridRow(children: [
            ResponsiveGridCol(
              lg: 2,
              child: Container(),
            ),
            ResponsiveGridCol(
              lg: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResponsiveGridRow(
                  children: [
                    // ここに要素
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
                          child: topInformation(),
                        ),
                      ),
                    ),
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

  Widget topInformation() {
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
                const Text("20°",
                    style: TextStyle(color: Colors.white, fontSize: 64)),
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
            MiniInfo(MaterialCommunityIcons.water_outline, "湿度"),
            MiniInfo(MaterialCommunityIcons.gauge, "気圧"),
            MiniInfo(MaterialCommunityIcons.weather_windy, "風速"),
            MiniInfo(MaterialCommunityIcons.arrow_bottom_left, "風向"),
            MiniInfo(MaterialCommunityIcons.cup, "雨量"),
          ]),
        )
      ],
    );
  }

  ResponsiveGridCol MiniInfo(IconData iconData, String title) {
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
          Text("75%",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final Widget? child;
  final bool isNormal;

  const GlassBox({this.child, this.isNormal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isNormal ? Colors.white : null,
        borderRadius: BorderRadius.circular(16.0),
        gradient: !isNormal
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                ],
                stops: [0.0, 1.0],
              )
            : null,
      ),
      child: child,
    );
  }
}
