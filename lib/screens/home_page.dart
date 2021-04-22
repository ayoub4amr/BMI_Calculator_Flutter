import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/shared/calculation.dart';
import 'package:bmi_calculator/shared/constants.dart';
import 'package:bmi_calculator/shared/content_of_my_container.dart';
import 'package:bmi_calculator/shared/my_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color malecolor = kInactiveColor;
Color femalecolor = kInactiveColor;
int height = 180;
int weight = 70;
int age = 18;

enum Gender { male, female }

void clicked(Gender gender) {
  // if (gender == Gender.male) {
  //   malecolor = activeContainerColor;
  //   femalecolor = inactiveColor;
  // } else if (gender == Gender.female) {
  //   femalecolor = activeContainerColor;
  //   malecolor = inactiveColor;
  // }
  malecolor = gender == Gender.male ? kActiveColor : kInactiveColor;
  femalecolor = gender == Gender.female ? kActiveColor : kInactiveColor;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onTap: () {
                      setState(() {
                        clicked(Gender.male);
                      });
                    },
                    color: malecolor,
                    child: ChildContainer(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onTap: () {
                      setState(() {
                        clicked(Gender.female);
                      });
                    },
                    color: femalecolor,
                    child: ChildContainer(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              color: kInactiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextStyle40,
                      ),
                      Text(
                        ' cm',
                        style: kTextStyle24,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: kActiveColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    color: kInactiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle24,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyle40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    color: kInactiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle24,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyle40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Calculation bmi = Calculation(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              bmi: bmi.getBmi(),
                              color: bmi.getColor(),
                              result: bmi.getResult(),
                            )));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function function;

  RoundIconButton({this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4c4c),
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      child: Icon(icon),
    );
  }
}
