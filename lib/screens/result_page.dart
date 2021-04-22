import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/my_container.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String bmi;
  final Color color;
  final String result;

  Result({this.bmi, this.color, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: kTextStyle56,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: MyContainer(
              color: kInactiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: color),
                  ),
                  Text(
                    bmi,
                    style: kTextStyle156,
                  ),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'RE-CALCULATE',
                  style: kTextStyle24,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kActiveColor),
                margin: EdgeInsets.all(4),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 10,
              ))
        ],
      ),
    );
  }
}
