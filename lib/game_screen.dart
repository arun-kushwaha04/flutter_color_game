import 'package:flutter/cupertino.dart';

import 'first_option.dart';
import 'second_option.dart';

class GameScreen extends StatelessWidget {
  final double size = 150;
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

  const GameScreen(
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
      required this.thirdCickHandler});

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