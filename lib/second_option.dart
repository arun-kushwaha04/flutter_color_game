import 'package:flutter/material.dart';

import 'circle_button.dart';

class SecondOption extends StatelessWidget {
  final double size = 150;
  final bool showButton;
  final Color color1;
  final Color color2;
  final VoidCallback firstClickHandler;
  final VoidCallback secondCickHandler;

  const SecondOption(
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