// AppBar
// Dropdown menus for time, muscle group, and difficulty level
// "Generate workout" button at the bottom of the page. Pressing this button
// routes to workout_page.dart

import 'package:fitnessbuddy/widgets/dropdown_menu.dart';
import 'package:fitnessbuddy/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //final items = ['Time Duration', 'Muscle Groups', 'Difficulty Level'];
  String? value;

  @override
  Widget build(BuildContext context) {
    print("In build method of main page");
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Difficulty Level"),
            const DropdownMenu(items: ["Easy", "Medium", "Hard"]),
            const Text("Muscle Group"),
            const DropdownMenu(items: [
              "Abs",
              "Arms",
              "Back",
              "Butt/Hips",
              "Chest",
              "Full Body/Integrated",
              "Legs - Calves and Shins",
              "Shoulders",
              "Legs - Thighs"
            ]),
            const Text("Time Duration"),
            const DropdownMenu(items: [
              "5 minutes",
              "10 minutes",
              "15 minutes",
              "20 minutes",
              "25 minutes",
              "30 minutes"
            ]),
            ElevatedButton(
                // when pressed, send an event to the bloc
                // use Navigator to route to the other page
                // This is just a test workout. You would use the difficulty, time
                //, etc. selected from the dropdown menus
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutPage()));
                },
                child: const Text("Generate Workout"))
          ] //DropdownButtonHideUnderline
              ), //center
        ));
  } //scaffold

}
