import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  Calculator({@required this.weight, @required this.height});
  final int weight;
  final int height;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return '😢 You have a higher than normal body weight. Try to exercise more. 😢';
    } else if (_bmi >= 18.5) {
      return '😊 You have a normal body weight, Good job! 😊';
    } else {
      return '😢 You have a lower than normal body weight. You can eat a bit more. 😢';
    }
  }
}
