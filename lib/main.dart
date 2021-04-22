import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E40),
          scaffoldBackgroundColor: Color(0xff0a0e3f)),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return MyHomePage();
        },
        '/result': (context) {
          return Result();
        },
      },
    );
  }
}
