import 'package:flutter/material.dart';

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
          // ignore: prefer_const_literals_to_create_immutables
          stops: [0.0, 1.0],
        )
            : null,
      ),
      child: child,
    );
  }
}