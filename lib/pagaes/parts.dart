import 'package:ajisai/pagaes/common/background_container.dart';
import 'package:ajisai/pagaes/common/glass_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
              Text("パーツリスト"),
              GlassBox(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

}