import 'dart:convert';

import 'package:ajisai/providers/weather.dart';
import 'package:ajisai/providers/weather_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WeatherDashboardPage extends HookWidget {
  
  final testJson = '''
  [{"_id":"60ae4f00916286ba94583a7d","altitude":18,"createdat":"2021-05-26T22:37:04.563+09:00","humidity":102400,"pressure":25905076,"rain":0.077,"soilmoisture":373,"soiltemperature":-6,"temperature":2267,"updatedat":"2021-05-26T22:37:04.563+09:00","winddirection":"NE","windspeed":0}]
  ''';
  
  @override
  Widget build(BuildContext context) {
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GlassBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5:13 JST時点",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                        const Text("20°",
                            style:
                                TextStyle(color: Colors.white, fontSize: 64)),
                        const Text("晴れ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final Widget? child;

  const GlassBox({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
