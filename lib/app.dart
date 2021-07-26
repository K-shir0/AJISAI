import 'package:ajisai/pagaes/my_home.dart';
import 'package:ajisai/pagaes/parts.dart';
import 'package:ajisai/pagaes/weather_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class App extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (context) => WeatherDashboardPage());
        }
        
        if (settings.name == '/parts') {
          return MaterialPageRoute(builder: (context) => PartsPage());
        }

        // Default Routing
        return MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page Default'));
      },
    );
  }
}
