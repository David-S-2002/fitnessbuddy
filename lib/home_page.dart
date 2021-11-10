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
    print("Making changes...");

    return Scaffold(
        appBar: AppBar(title: const Text("Fitness Buddy")),
        body: const Center(
            child: Text("This is the home page for FitnessBuddy")));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items = ['Time Duration', 'Muscle Groups', 'Difficulty Level'];
  String? value;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Dropdown Menu'), centerTitle: true),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 4),
          ), //BoxDecoration
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              iconSize: 36,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              isExpanded: true,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.value = value),
            ), //Drop down button
          ), //DropdownButtonHideUnderline
        ), //center
      )); //scaffold

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
