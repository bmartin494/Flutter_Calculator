import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_value.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final Color? textColor;
  final Color? buttonColor;

  const CalculatorButton(
      {
        required this.buttonText,
        required this.textColor,
        required this. buttonColor})
      : assert(
        buttonText != null,
        'A non-null String must be provided for this widget.',
  ),
      assert(
        textColor != null,
      'A text color must be provided for this widget.',
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pressButton(buttonText, context);
      },
      child: Text(buttonText,
        style: TextStyle(
          fontSize: 35,
          color: textColor,
        ),
      ),
      //all this styling is new from tutorial followed
      style: ElevatedButton.styleFrom(
        shape : const CircleBorder(),
        primary: buttonColor,
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(80, 80),
      ),
    );
  }

  void pressButton(String title, BuildContext context) {
    String numberString = Provider
        .of<CalculatorValue>(context)
        .numberString;
    bool shouldCalculate = Provider
        .of<CalculatorValue>(context)
        .shouldCalculate;

    if (title == "+" || title == "-" || title == "*" || title == "/") {
      if (shouldCalculate) {
        Provider.of<CalculatorValue>(context).calculateValue();
      } else {
        Provider
            .of<CalculatorValue>(context)
            .result =
            double.parse(numberString);
        Provider
            .of<CalculatorValue>(context)
            .shouldCalculate = true;
      }

      Provider
          .of<CalculatorValue>(context)
          .numberString = '';
      Provider
          .of<CalculatorValue>(context)
          .operation = title;
    } else if (title == '=') {
      Provider.of<CalculatorValue>(context).calculateValue();
      Provider
          .of<CalculatorValue>(context)
          .shouldCalculate = false;
    } else if (title == 'CE') {
      Provider
          .of<CalculatorValue>(context)
          .numberString = '';
      Provider
          .of<CalculatorValue>(context)
          .displayString = '0';
      Provider
          .of<CalculatorValue>(context)
          .shouldCalculate = false;
    } else {
      if (numberString == '0' || numberString == '0.0') {
        Provider
            .of<CalculatorValue>(context)
            .numberString = '';
      }
      Provider
          .of<CalculatorValue>(context)
          .numberString += title;
      Provider
          .of<CalculatorValue>(context)
          .displayString = numberString;
    }
  }
}