import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final Color color;
  final VoidCallback clickHandler;

  const CircleButton(
      {super.key,
      required this.size,
      required this.color,
      required this.clickHandler});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: clickHandler,
        radius: size / 2,
        child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)));
  }
}