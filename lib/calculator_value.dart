import 'package:flutter/material.dart';

class CalculatorValue with ChangeNotifier {
  String _numberString = "0";
  String get numberString => _numberString;
  set numberString(String numberString) {
    _numberString = numberString;
    notifyListeners();
  }

  String _displayString = "0";
  String get displayString => _displayString;
  set displayString(String displayString) {
    _displayString = displayString;
    notifyListeners();
  }

  double _result = 0.0;
  double get result => _result;
  set result(result) {
    _result = result;
    notifyListeners();
  }

  String _operation = '';
  String get operation => _operation;
  set operation(String operation) {
    _operation = operation;
    notifyListeners();
  }

  bool _shouldCalculate = false;
  bool get shouldCalculate => _shouldCalculate;
  set shouldCalculate(bool shouldCalculate) {
    _shouldCalculate = shouldCalculate;
    notifyListeners();
  }

  void calculateValue() {
    switch (_operation) {
      case '+':
        _result += double.parse(_numberString);
        break;
      case '-':
        _result -= double.parse(_numberString);
        break;
      case '*':
        _result *= double.parse(_numberString);
        break;
      case '/':
        _result /= double.parse(_numberString);
        break;
      default:
        break;
    }

    _numberString = _result.toString();
    _displayString = _numberString;
    notifyListeners();
  }
}