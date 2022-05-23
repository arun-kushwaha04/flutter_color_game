import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double _size = 100.0;
  static const double _gap = 25;
  static const bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Color Game',
        home: Scaffold(
            appBar: AppBar(title: const Text('Color Game')),
            body: HomeScreen(
              size: _size,
              gap: _gap,
            )));
  }
}

class HomeScreen extends StatelessWidget {
  final double size;
  final double gap;

  const HomeScreen({super.key, required this.size, required this.gap});

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
                CircleButton(size: size, color: Colors.red),
                VerticalDivider(
                  width: gap,
                ),
                CircleButton(size: size, color: Colors.yellow),
              ]),
          Container(
            height: gap,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleButton(size: size, color: Colors.blue),
                VerticalDivider(
                  width: gap,
                ),
                CircleButton(size: size, color: Colors.green),
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
          const Text(
            "Simple Game, Try tap on the right color to proceed futher.",
            textAlign: TextAlign.center,
          )
        ]);
  }
}

class CircleButton extends StatelessWidget {
  final double size;
  final Color color;

  const CircleButton({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: () {},
        radius: size / 2,
        child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)));
  }
}
