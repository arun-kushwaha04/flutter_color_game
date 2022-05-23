import 'dart:math';
import 'package:flutter/material.dart';

import 'game_screen.dart';
import 'home_screen.dart';

class MyWidget extends StatefulWidget {
  final double _gap = 25;
  final double _size = 100.0;
  final bool _isPlaying = false;
  final int _score = 0;
  final double _probOfFirstOption = 0.6;
  final bool _showButton = false;
  final bool _isSelectedButtonCorrect = false;
  final Color _color1 =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final Color _color2 =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isPlaying = false;
  int score = 0;
  double probOfFirstOption = 0.6;
  bool showButton = false;
  bool isSelectedButtonCorrect = false;
  Color color1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  Color color2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];

// Colors.primaries[Random().nextInt(Colors.primaries.length)]

  @override
  void initState() {
    isPlaying = widget._isPlaying;
    score = widget._score;
    probOfFirstOption = widget._probOfFirstOption;
    showButton = widget._showButton;
    isSelectedButtonCorrect = widget._isSelectedButtonCorrect;
    color1 = widget._color1;
    color2 = widget._color2;
    super.initState();
  }

  void _startGame() {
    setState(() {
      isPlaying = true;
      generateColor();
    });
  }

  void endGame() {
    setState(() {
      isPlaying = false;
    });
  }

  void updateScore() {
    setState(() {
      score += 1;
    });
  }

  void reset() {
    int randInt = Random().nextInt(1000);
    setState(() {
      isPlaying = false;
      score = 0;
      showButton = false;
      probOfFirstOption = randInt / 1000;
    });
  }

  void firstClickHandler() {
    setState(() {
      if (!showButton) {
        score += 1;
      }
      showButton = true;
      isSelectedButtonCorrect = true;
    });
  }

  void secondClickHandler() {
    setState(() {
      showButton = true;
      isSelectedButtonCorrect = false;
    });
  }

  void thirdClickHandler() {
    int randInt = Random().nextInt(1000);
    setState(() {
      generateColor();
      probOfFirstOption = randInt / 1000;
      showButton = false;
    });
  }

  void generateColor() {
    Color tcolor1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    Color tcolor2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    while (tcolor1 == tcolor2) {
      tcolor2 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    }

    setState(() {
      color1 = tcolor1;
      color2 = tcolor2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isPlaying) {
      return HomeScreen(
        size: widget._size,
        gap: widget._gap,
        startGame: _startGame,
      );
    } else {
      return GameScreen(
        score: score,
        correctClickHandler: updateScore,
        reset: reset,
        showButton: showButton,
        probOfFirstOption: probOfFirstOption,
        color1: color1,
        color2: color2,
        isSelectedButtonCorrect: isSelectedButtonCorrect,
        firstClickHandler: firstClickHandler,
        secondCickHandler: secondClickHandler,
        thirdCickHandler: thirdClickHandler,
      );
    }
  }
}
