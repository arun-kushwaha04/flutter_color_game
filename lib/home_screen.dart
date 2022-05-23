import 'package:flutter/material.dart';

import 'circle_button.dart';

class HomeScreen extends StatelessWidget {
  final double size;
  final double gap;
  final VoidCallback startGame;

  const HomeScreen(
      {super.key,
      required this.size,
      required this.gap,
      required this.startGame});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                  size: size,
                  color: Colors.red,
                  clickHandler: startGame,
                ),
                VerticalDivider(
                  width: gap,
                ),
                CircleButton(
                    size: size, color: Colors.yellow, clickHandler: startGame),
              ]),
          Container(
            height: gap,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleButton(
                    size: size, color: Colors.blue, clickHandler: startGame),
                VerticalDivider(
                  width: gap,
                ),
                CircleButton(
                    size: size, color: Colors.green, clickHandler: startGame),
              ]),
          Container(
            height: 2 * gap,
          ),
          const Text(
            "Welcome to the color game!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            height: gap,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Simple Game, Try tap on the right color to proceed futher. Click on any circle to continue !!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.clip,
            ),
          )
        ]);
  }
}