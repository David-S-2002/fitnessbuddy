// When the GenerateWorkout event gets sent to the BLOC,
// the BLOC will call the algorithm, which will return a workout
// (list of Circuits) based on these parameters. The BLOC will pass
// the parameters to the algorithm.

import 'barrel.dart';
import 'models.dart';

// Calculate how much rest time there will be in between

// Determine how many times each circuit will be repeated
// Determine how to split up a single iteration of a circuit into exercises

// Using the repository, get all the exercises that fit the muscle group
// and the difficulty we want

// Fill the time intervals we have determined with the exercises, randomly chosen

// Once an exercise has been chosen, remove it from the list of possible exercises

// I might want to check if the workout time is divisible by 5.
List<Circuit> algorithm(
    int workoutTime, MuscleGroup muscleGroup, Difficulty difficulty) {
  print("Creating empty list");
  List<Circuit> circuits = [];

  print("Created list");
  //circuits.length = workoutTime / 5 as int; // number of circuits in a workout

  print("We set the number of circuits");

  double circuitTimePlusRest =
      5; // time per circuit, plus the rest time at the end
  double restTime = 0.5; // time to rest BETWEEN circuits

  int timesRepeated = 3; // how many times one circuit is repeated
  double timePerExercise = 0.5; // duration of one exercise
  double restInCircuit = 0.5; // rest time WITHIN the circuit

  print("Initializing exercise times");
  // Initialize these to different values depending on the difficulty:
  if (difficulty == Difficulty.hard) {
    print("Difficulty: hard");
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = (1 / 6); // 10 seconds

  } else if (difficulty == Difficulty.medium) {
    print("Difficulty: medium");
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = 0.5; // 30 sec
  } else if (difficulty == Difficulty.easy) {
    print("Difficulty: easy");
    timePerExercise = 0.5;
    restInCircuit = 0.5;
  } else {
    print("Invalid difficulty");
    throw Exception("Invalid difficulty passed into algorithm");
  }

  // Populate the list with numCircuits circuits; we know the rest time,
  // and exercise time, next we need to get the exercises
  for (int i = 0; i <= (workoutTime / 5 as int); i++) {
    circuits.add(Circuit(
        restTime: restInCircuit, exercises: [], timesRepeated: timesRepeated));
  }

  // get and choose the exercises:

  print("Circuit list: " + circuits.toString());
  return circuits;
}
