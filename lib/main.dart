import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results.dart';

void main() {
  runApp(BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff0A0D22),
      ),
      home: InputPage(),
      routes: {
        '/results': (context) => ResultsPage(),
        'calculate': (context) => InputPage(),
      },
    );
  }
}




