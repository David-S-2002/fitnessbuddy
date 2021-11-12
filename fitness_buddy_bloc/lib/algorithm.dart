// When the GenerateWorkout event gets sent to the BLOC,
// the BLOC will call the algorithm, which will return a workout
// (list of Circuits) based on these parameters. The BLOC will pass
// the parameters to the algorithm.

import 'barrel.dart';
import 'models.dart';

// Using the repository, get all the exercises that fit the muscle group
// and the difficulty we want

// Fill the time intervals we have determined with the exercises, randomly chosen

// Once an exercise has been chosen, remove it from the list of possible exercises

// I might want to check if the workout time is divisible by 5.
Future<List<Circuit>> algorithm(int workoutTime, MuscleGroup muscleGroup,
    Difficulty difficulty, ExerciseRepository repository) async {
  List<Circuit> circuits = [];
  List<BLOCExercise> allExercises = [];
  double circuitTimePlusRest =
      5; // time per circuit, plus the rest time at the end
  double restTime = 0.5; // time to rest BETWEEN circuits

  int timesRepeated = 3; // how many times one circuit is repeated
  double timePerExercise; // duration of one exercise
  double restInCircuit; // rest time WITHIN the circuit
  int intDifficulty; // int representation of difficulty, for repo

  // Initialize these to different values depending on the difficulty:
  if (difficulty == Difficulty.hard) {
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = (1 / 6); // 10 seconds
    intDifficulty = 3;
  } else if (difficulty == Difficulty.medium) {
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = 0.5; // 30 sec
    intDifficulty = 2;
  } else if (difficulty == Difficulty.easy) {
    timePerExercise = 0.5;
    restInCircuit = 0.5;
    intDifficulty = 1;
  } else {
    print("Invalid difficulty");
    throw Exception("Invalid difficulty passed into algorithm");
  }

  // Populate the list with numCircuits circuits
  for (int i = 0; i <= (workoutTime / 5 as int); i++) {
    circuits.add(Circuit(
        restTime: restInCircuit, exercises: [], timesRepeated: timesRepeated));
  }

  // get the exercises:
  // call the function in the repository that selects exercises by muscle group
  // and difficulty. Use "await"

  // allExercises = (await repository.selectByMuscleGroupAndDifficulty(
  //         muscleGroup.toString(), intDifficulty))
  //     .convertRepoExerciseToBlocExercise();

  // Populate each circuit by picking randomly from these exercises.

  return circuits;
}
