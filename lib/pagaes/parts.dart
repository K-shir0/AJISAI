import 'package:ajisai/pagaes/common/background_container.dart';
import 'package:ajisai/pagaes/common/glass_box.dart';
import 'package:ajisai/providers/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PartsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("パーツリスト"),
              Thermometer(),
            ],
          ),
        ],
      ),
    );
  }
}

class TemperatureGraph extends StatelessWidget {
  final List<Weather> weathers;

  TemperatureGraph({required this.weathers});

  @override
  Widget build(BuildContext context) {
    // 加工
    final List<_ChartData> test = [];

    for (Weather weather in weathers) {
      if (weather.temperature != null &&
          weather.humidity != null &&
          weather.createdAt != null) {
        test.add(_ChartData(weather.updatedAt!, weather.getTemperature()!,
            weather.getHumidity()!.toDouble()));
      }
    }

    weathers.map((e) {});

    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      // グラフのタイトル
      title: ChartTitle(
          text: '気温',
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      primaryXAxis: DateTimeAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          intervalType: DateTimeIntervalType.minutes,
          isVisible: false,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}°',
          axisLine: const AxisLine(width: 0),
          isVisible: false,
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: [
        AreaSeries<_ChartData, DateTime>(
          animationDuration: 2500,
          dataSource: test,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          color: Color(0xfff5af19).withOpacity(0.6),
          borderColor: Color(0xffF37335).withOpacity(0.6),
          borderWidth: 2,
          name: '気温',
          markerSettings: MarkerSettings(isVisible: false),
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.top,
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.6))),
        ),
      ],
      trackballBehavior: TrackballBehavior(
        enable: true,
        lineType: TrackballLineType.vertical,
      ),
      crosshairBehavior: CrosshairBehavior(enable: true),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

// List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
//   final List<_ChartData> chartData = <_ChartData>[
//     _ChartData(2005, 21, 28),
//     _ChartData(2006, 24, 44),
//     _ChartData(2007, 36, 48),
//     _ChartData(2008, 38, 50),
//     _ChartData(2009, 54, 66),
//     _ChartData(2010, 57, 78),
//     _ChartData(2011, 70, 84)
//   ];
//   return <LineSeries<_ChartData, num>>[
//     LineSeries<_ChartData, num>(
//         animationDuration: 2500,
//         dataSource: chartData,
//         xValueMapper: (_ChartData sales, _) => sales.x,
//         yValueMapper: (_ChartData sales, _) => sales.y,
//         width: 2,
//         name: 'Germany',
//         markerSettings: MarkerSettings(isVisible: true)),
//     LineSeries<_ChartData, num>(
//         animationDuration: 2500,
//         dataSource: chartData,
//         width: 2,
//         name: 'England',
//         xValueMapper: (_ChartData sales, _) => sales.x,
//         yValueMapper: (_ChartData sales, _) => sales.y2,
//         markerSettings: MarkerSettings(isVisible: true))
//   ];
// }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final DateTime x;
  final double y;
  final double y2;
}

class Thermometer extends StatelessWidget {
  final double meterValue;
  final double _temperatureValue = 24.0;

  const Thermometer({this.meterValue = -21});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SfLinearGauge(
            minimum: -20,
            maximum: 50,
            interval: 10,
            minorTicksPerInterval: 0,
            axisTrackExtent: 23,
            axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 12,
                color: Colors.white,
                borderWidth: 1,
                edgeStyle: LinearEdgeStyle.bothCurve),
            tickPosition: LinearElementPosition.outside,
            labelPosition: LinearLabelPosition.outside,
            orientation: LinearGaugeOrientation.vertical,
            markerPointers: [
              LinearWidgetPointer(
                  markerAlignment: LinearMarkerAlignment.end,
                  value: 50,
                  enableAnimation: false,
                  position: LinearElementPosition.outside,
                  offset: 8,
                  child: Container(
                    height: 30,
                    child: const Text(
                      '°C',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  )),
              const LinearShapePointer(
                value: -20,
                markerAlignment: LinearMarkerAlignment.start,
                shapeType: LinearShapePointerType.circle,
                borderWidth: 1,
                borderColor: Colors.black26,
                color: Colors.white,
                // TODO
                position: LinearElementPosition.cross,
                width: 24,
                height: 24,
              ),
              LinearShapePointer(
                value: -20,
                markerAlignment: LinearMarkerAlignment.start,
                shapeType: LinearShapePointerType.circle,
                borderWidth: 6,
                borderColor: Colors.transparent,
                color: color(),
                position: LinearElementPosition.cross,
                width: 24,
                height: 24,
              ),
              LinearWidgetPointer(
                  value: -20,
                  markerAlignment: LinearMarkerAlignment.start,
                  child: Container(
                    width: 10,
                    height: 3.4,
                    decoration: BoxDecoration(
                      border: const Border(
                        left:
                            BorderSide(width: 2.0, color: Colors.white), //TODO
                        right:
                            BorderSide(width: 2.0, color: Colors.white), //TODO
                      ),
                      color: color(),
                    ),
                  )),
              LinearWidgetPointer(
                  value: meterValue,
                  enableAnimation: false,
                  position: LinearElementPosition.outside,
                  // onValueChanged: (value) => {
                  //   setState(() {
                  //     _meterValue = value;
                  //   })
                  // },
                  child: Container(
                      width: 16,
                      height: 12,
                      transform: Matrix4.translationValues(1, -2, 0.0),
                      child: meterValue >= -20
                          ? Icon(
                              Icons.arrow_right,
                              color: color(),
                              size: 24,
                            )
                          : null)),
              LinearShapePointer(
                value: meterValue,
                width: 20,
                height: 20,
                enableAnimation: false,
                color: Colors.transparent,
                position: LinearElementPosition.cross,
                // onValueChanged: (value) => {
                //   setState(() {
                //     _meterValue = value;
                //   })
                // },
              )
            ],
            barPointers: <LinearBarPointer>[
              LinearBarPointer(
                value: meterValue,
                enableAnimation: false,
                thickness: 6,
                edgeStyle: LinearEdgeStyle.endCurve,
                color: color(),
              )
            ]),
      ],
    );
  }

  Color color() {
    if (meterValue < -20) return Colors.white;
    return meterValue > _temperatureValue
        ? const Color(0xffFF7B7B)
        : const Color(0xff0074E3);
  }
}
