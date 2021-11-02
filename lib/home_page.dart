// AppBar
// Dropdown menus for time, muscle group, and (maybe) difficulty level
// "Generate workout" button at the bottom of the page. Pressing this button
// routes to workout_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("Printing to see where this message goes...");

    return Scaffold(
        appBar: AppBar(title: const Text("Fitness Buddy")),
        body: const Center(
            child: Text("This is the home page for FitnessBuddy")));
  }
}
