import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Color Game',
        home: Scaffold(
            appBar: AppBar(title: const Text('Color Game')), body: MyWidget()));
  }
}

class MyWidget extends StatefulWidget {
  final double _gap = 25;
  final double _size = 100.0;
  bool _isPlaying = false;
  int _score = 0;
  double _probOfFirstOption = 0.6;
  bool _showButton = false;
  bool _isSelectedButtonCorrect = false;
  Color _color1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  Color _color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];

  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  void _startGame() {
    setState(() {
      widget._isPlaying = true;
    });
  }

  void endGame() {
    setState(() {
      widget._isPlaying = false;
    });
  }

  void updateScore() {
    setState(() {
      widget._score += 1;
    });
  }

  void reset() {
    int randInt = Random().nextInt(1000);
    setState(() {
      widget._isPlaying = false;
      widget._score = 0;
      widget._showButton = false;
      widget._probOfFirstOption = randInt / 1000;
    });
  }

  void firstClickHandler() {
    setState(() {
      if (!widget._showButton) {
        widget._score += 1;
      }
      widget._showButton = true;
      widget._isSelectedButtonCorrect = true;
    });
  }

  void secondClickHandler() {
    setState(() {
      widget._showButton = true;
      widget._isSelectedButtonCorrect = false;
    });
  }

  void thirdClickHandler() {
    print("Correct button click called");
    int randInt = Random().nextInt(1000);
    setState(() {
      generateColor();
      widget._probOfFirstOption = randInt / 1000;
      widget._showButton = false;
    });
  }

  void generateColor() {
    Color color1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    Color color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    while (color1 == color2) {
      color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    }

    setState(() {
      widget._color1 = color1;
      widget._color2 = color2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget._isPlaying) {
      return HomeScreen(
        size: widget._size,
        gap: widget._gap,
        startGame: _startGame,
      );
    } else {
      return GameScreen(
        score: widget._score,
        correctClickHandler: updateScore,
        reset: reset,
        showButton: widget._showButton,
        probOfFirstOption: widget._probOfFirstOption,
        color1: widget._color1,
        color2: widget._color2,
        isSelectedButtonCorrect: widget._isSelectedButtonCorrect,
        firstClickHandler: firstClickHandler,
        secondCickHandler: secondClickHandler,
        thirdCickHandler: thirdClickHandler,
      );
    }
  }
}

class HomeScreen extends StatelessWidget {
  final double size;
  final double gap;
  final VoidCallback startGame;

  HomeScreen(
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

class GameScreen extends StatelessWidget {
  double size = 150;
  final int score;
  final bool showButton;
  final bool isSelectedButtonCorrect;
  final double probOfFirstOption;
  final Color color1;
  final Color color2;
  final VoidCallback correctClickHandler;
  final VoidCallback reset;
  final VoidCallback firstClickHandler;
  final VoidCallback secondCickHandler;
  final VoidCallback thirdCickHandler;

  GameScreen(
      {super.key,
      required this.score,
      required this.correctClickHandler,
      required this.reset,
      required this.showButton,
      required this.probOfFirstOption,
      required this.color1,
      required this.color2,
      required this.isSelectedButtonCorrect,
      required this.firstClickHandler,
      required this.secondCickHandler,
      required this.thirdCickHandler
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  !showButton
                      ? "Choose a Circle"
                      : isSelectedButtonCorrect
                          ? "Amazing..."
                          : "Good luck next time ",
                  textAlign: TextAlign.center,
                  style: !showButton
                      ? const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)
                      : isSelectedButtonCorrect
                          ? const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 6, 253, 14))
                          : const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 250, 17, 0)),
                  overflow: TextOverflow.clip,
                ),
                Container(
                  height: 8,
                ),
                Text(
                  "Your score $score",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
            Container(
              height: size,
            ),
            probOfFirstOption < 0.5
                ? FirstOption(
                    firstClickHandler: firstClickHandler,
                    secondCickHandler: secondCickHandler,
                    showButton: showButton,
                    color1: color1,
                    color2: color2,
                  )
                : SecondOption(
                    firstClickHandler: firstClickHandler,
                    secondCickHandler: secondCickHandler,
                    showButton: showButton,
                    color1: color1,
                    color2: color2,
                  ),
            Container(
              height: size,
            ),
            Visibility(
                visible: showButton,
                child: CupertinoButton.filled(
                    onPressed:
                        isSelectedButtonCorrect ? thirdCickHandler : reset,
                    child: Text(isSelectedButtonCorrect ? "Next" : "Reset")))
          ]),
    );
  }
}

class FirstOption extends StatelessWidget {
  double size = 150;
  final bool showButton;
  final Color color1;
  final Color color2;
  final VoidCallback firstClickHandler;
  final VoidCallback secondCickHandler;

  FirstOption(
      {super.key,
      required this.firstClickHandler,
      required this.secondCickHandler,
      required this.showButton,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleButton(
            size: size, color: color1, clickHandler: firstClickHandler),
        Visibility(
          visible: !showButton,
          child: const VerticalDivider(
            width: 10,
          ),
        ),
        Visibility(
            visible: !showButton,
            child: CircleButton(
                size: size, color: color2, clickHandler: secondCickHandler))
      ],
    );
  }
}

class SecondOption extends StatelessWidget {
  double size = 150;
  final bool showButton;
  final Color color1;
  final Color color2;
  final VoidCallback firstClickHandler;
  final VoidCallback secondCickHandler;

  SecondOption(
      {super.key,
      required this.firstClickHandler,
      required this.secondCickHandler,
      required this.showButton,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
            visible: !showButton,
            child: CircleButton(
                size: size, color: color1, clickHandler: secondCickHandler)),
        Visibility(
          visible: !showButton,
          child: const VerticalDivider(
            width: 10,
          ),
        ),
        CircleButton(size: size, color: color2, clickHandler: firstClickHandler)
      ],
    );
  }
}

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
