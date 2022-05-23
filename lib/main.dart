import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const double _size = 100.0;
  static const double _gap = 25;

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

class HomeScreen extends StatefulWidget {
  bool _isPlaying = false;
  final double size;
  final double gap;

  HomeScreen({super.key, required this.size, required this.gap});

  void StartGame() {
    _isPlaying = true;
  }

  void EndGame() {
    _isPlaying = false;
  }

  

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  
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
                CircleButton(size: widget.size, color: Colors.red),
                VerticalDivider(
                  width: widget.gap,
                ),
                CircleButton(size: widget.size, color: Colors.yellow),
              ]),
          Container(
            height: widget.gap,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleButton(size: widget.size, color: Colors.blue),
                VerticalDivider(
                  width: widget.gap,
                ),
                CircleButton(size: widget.size, color: Colors.green),
              ]),
          Container(
            height: 2 * widget.gap,
          ),
          const Text(
            "Welcome to the color game!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            height: widget.gap,
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
