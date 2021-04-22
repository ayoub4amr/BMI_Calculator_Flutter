import 'dart:math';
import 'package:flutter/material.dart';

class Calculation {
  final int height;
  final int weight;
  double bmi;

  Calculation({this.height, this.weight});

  String getBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  Color getColor() {
    if (bmi >= 25) {
      return Colors.red;
    } else if (bmi > 18.5) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
