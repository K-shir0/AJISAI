import 'package:ajisai/pagaes/common/background_container.dart';
import 'package:ajisai/pagaes/common/glass_box.dart';
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

class Thermometer extends StatelessWidget {
  final double _meterValue = 38;
  final double _temperatureValue = 37.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(26, 0, 0.0),
      height: 256,
      child: Row(
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
                  borderColor: Colors.white30,
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
                  color: _meterValue > _temperatureValue
                      ? const Color(0xffFF7B7B)
                      : const Color(0xff0074E3),
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
                          left: BorderSide(
                              width: 2.0, color: Colors.white), //TODO
                          right: BorderSide(
                              width: 2.0, color: Colors.white), //TODO
                        ),
                        color: _meterValue > _temperatureValue
                            ? const Color(0xffFF7B7B)
                            : const Color(0xff0074E3),
                      ),
                    )),
                LinearWidgetPointer(
                    value: _meterValue,
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
                        child: Icon(
                          Icons.arrow_right,
                          color: _meterValue > _temperatureValue
                              ? const Color(0xffFF7B7B)
                              : const Color(0xff0074E3),
                          size: 24,
                        ))),
                LinearShapePointer(
                  value: _meterValue,
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
                  value: _meterValue,
                  enableAnimation: false,
                  thickness: 6,
                  edgeStyle: LinearEdgeStyle.endCurve,
                  color: _meterValue > _temperatureValue
                      ? const Color(0xffFF7B7B)
                      : const Color(0xff0074E3),
                )
              ]),
        ],
      ),
    );
  }
}
