// AppBar
// Dropdown menus for time, muscle group, and difficulty level
// "Generate workout" button at the bottom of the page. Pressing this button
// routes to workout_page.dart

import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitnessbuddy/widgets/dropdown_menu.dart';
import 'package:fitnessbuddy/workout_page/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_buddy_bloc/fitness_buddy_bloc.dart';

// maps the difficulty integer values to the strings that will be used
// in the difficulty dropdown menu
Map<String, int> difficultyMap = {"Easy": 1, "Intermediate": 2, "Advanced": 3};

// list of dropdown menus that go in the home page
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
      "Chest",
      "Full Body/Integrated",
      "Legs/Butt/Hips",
      "Shoulders",
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

// tracks whether the user has chosen an item
// from all the dropdown menus
bool allMenuItemsChosen() {
  bool allItemsChosen = true;
  for (int i = 0; i < dropdownMenus.length; i++) {
    if (dropdownMenus[i].itemChosen == null) {
      allItemsChosen = false;
    }
  }

  return allItemsChosen;
}

// to determine the workout title for
// the workout page.
// If any items have not been chosen, returns null.
String? getWorkoutTitle() => allMenuItemsChosen()
    ? dropdownMenus[2].itemChosen! +
        " Minute " +
        dropdownMenus[0].itemChosen! +
        " " +
        dropdownMenus[1].itemChosen! +
        " Workout"
    : null;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? value;

  @override
  Widget build(BuildContext context) {
    print("In build method of main page");
    return BlocProvider<FitnessBuddyBloc>(
        create: (BuildContext context) => FitnessBuddyBloc(
            exerciseRepo: RepositoryProvider.of<ExerciseRepository>(context)),
        child: Scaffold(
            appBar: AppBar(
                title: const Text('Choose Your Workout'), centerTitle: true),
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
                        onPressed: () {
                          // if none of the dropdown values are null, send
                          // an event to the BLOC and navigate to the workout page
                          if (allMenuItemsChosen()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const WorkoutPage()));

                            BlocProvider.of<FitnessBuddyBloc>(context).add(
                                GenerateWorkout(
                                    workoutTime:
                                        int.parse(dropdownMenus[2].itemChosen!),
                                    muscleGroup: dropdownMenus[1].itemChosen!,
                                    difficulty: difficultyMap[
                                        dropdownMenus[0].itemChosen]!));
                          }
                        },
                        child: const Text("Generate Workout"))
                  ] //DropdownButtonHideUnderline
                  ), //center
            )));
  } //scaffold

}
