import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        backgroundColor: Color(0xFFFAE021),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
//      home: SafeArea(child: InputPage()),
      initialRoute: "InputPage",
      routes: {
        "InputPage": (context) => SafeArea(
              child: InputPage(),
            ),
        "ResultPage": (context) => SafeArea(
          child: ResultPage(),
        ),
      },
    );
  }
}
