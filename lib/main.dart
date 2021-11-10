import 'package:fitnessbuddy/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessBuddy());
}

class FitnessBuddy extends StatelessWidget {
  const FitnessBuddy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
