// AppBar
// Dropdown menus for time, muscle group, and difficulty level
// "Generate workout" button at the bottom of the page. Pressing this button
// routes to workout_page.dart

import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitnessbuddy/widgets/dropdown_menu.dart';
import 'package:fitnessbuddy/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_buddy_bloc/fitness_buddy_bloc.dart';

//
Map<String, int> difficultyMap = {"Easy": 1, "Intermediate": 2, "Advanced": 3};

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? value;

  List<DropdownMenu> dropdownMenus = [
    DropdownMenu(
      items: [
        // the strings in the difficulty map
        for (int i = 0; i < difficultyMap.length; i++)
          difficultyMap.keys.elementAt(i)
      ],
      itemChosen: null,
    ),
    DropdownMenu(
      items: const [
        "Abs",
        "Arms",
        "Back",
        "Butt/Hips",
        "Chest",
        "Full Body/Integrated",
        "Legs - Calves and Shins",
        "Shoulders",
        "Legs - Thighs",
      ],
      itemChosen: null,
    ),
    DropdownMenu(
      items: [
        5.toString(),
        10.toString(),
        15.toString(),
        20.toString(),
        25.toString(),
        30.toString()
      ],
      itemChosen: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("In build method of main page");
    return BlocProvider<FitnessBuddyBloc>(
        create: (BuildContext context) => FitnessBuddyBloc(
            exerciseRepo: RepositoryProvider.of<ExerciseRepository>(context)),
        child: Scaffold(
            appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Difficulty Level"),
                    dropdownMenus[0],
                    const Text("Muscle Group"),
                    dropdownMenus[1],
                    const Text("Time Duration"),
                    dropdownMenus[2],
                    TextButton(
                        // when pressed, send an event to the bloc
                        // use Navigator to route to the other page
                        // This is just a test workout. You would use the difficulty, time
                        //, etc. selected from the dropdown menus
                        onPressed: () {
                          // We want to disable the button if any of the values
                          // in the dropdown menus are null.

                          bool hasNullValues = false;
                          for (int i = 0; i < dropdownMenus.length; i++) {
                            if (dropdownMenus[i].itemChosen == null) {
                              hasNullValues = true;
                            }
                          }

                          // if none of the dropdown values are null, send
                          // an event to the BLOC and navigate to the workout page
                          if (!hasNullValues) {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             const WorkoutPage()));

                            BlocProvider.of<FitnessBuddyBloc>(context).add(
                                GenerateWorkout(
                                    workoutTime:
                                        int.parse(dropdownMenus[2].itemChosen!),
                                    muscleGroup: dropdownMenus[1].itemChosen!,
                                    difficulty: difficultyMap[
                                        dropdownMenus[0].itemChosen]!));
                          }
                          return;
                        },
                        child: const Text("Generate Workout"))
                  ] //DropdownButtonHideUnderline
                  ), //center
            )));
  } //scaffold

}
