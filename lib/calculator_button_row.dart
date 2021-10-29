import 'package:flutter/material.dart';
import 'package:calculator/calculator_button.dart';

class CalculatorButtonRow extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final String title4;

  final Color? buttonColor1;
  final Color? buttonColor2;

  final Color textColor1;
  final Color textColor2;

  const CalculatorButtonRow({

    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.textColor1,
    required this.textColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CalculatorButton(
            buttonText: title1,
            textColor: textColor1,
            buttonColor: buttonColor1,
          ),
          CalculatorButton(
            buttonText: title2,
            textColor: textColor1,
            buttonColor: buttonColor1,
          ),
          CalculatorButton(
            buttonText: title3,
            textColor: textColor1,
            buttonColor: buttonColor1,
          ),
          CalculatorButton(
            buttonText: title4,
            textColor: textColor2,
            buttonColor: buttonColor2,
          ),
        ],
      ),
    );
  }
}