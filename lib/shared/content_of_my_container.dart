import 'package:bmi_calculator/shared/constants.dart';
import 'package:flutter/material.dart';

class ChildContainer extends StatelessWidget {
  final String text;
  final IconData icon;

  ChildContainer({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          text,
          style: kTextStyle24,
        ),
      ],
    );
  }
}
