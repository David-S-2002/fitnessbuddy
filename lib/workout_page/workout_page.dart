import 'package:fitnessbuddy/home_page.dart';
import 'package:fitnessbuddy/workout_page/workout_views.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // By the time we get here, workout title shouldn't be null,
        // so we can use a null check.
        appBar: AppBar(title: Text(getWorkoutTitle()!), centerTitle: true),
        body: const WorkoutView());
  }
}
