import 'dart:math';
import 'barrel.dart';

const int SECONDS_PER_MINUTE = 60;

Future<List<Circuit>> algorithm(int workoutTime, String muscleGroup,
    int difficulty, ExerciseRepository repository) async {
  List<Circuit> circuits = [];
  List<RepoExercise> repoExercises = [];
  List<BLOCExercise> blocExercises = [];
  double restTimeBetweenCircuits = 30;

  int timesRepeated = 3; // how many times one circuit is repeated
  double timePerExercise; // duration of one exercise
  double restInCircuit; // rest time WITHIN the circuit
  int numExercisesInCircuit;
  Random random = Random();
  int randNum;

  // get all the possible exercises from the repository:
  repoExercises = await repository.selectByMuscleGroupAndDifficulty(
      muscleGroup, difficulty);

  // if (repoExercises.isEmpty) {
  //   return [];
  //   print("No exercises found");
  // }

  blocExercises =
      List<BLOCExercise>.filled(repoExercises.length, emptyExercise);

  // Set the fields of the circuit depending on difficulty:
  if (difficulty == 3) {
    timePerExercise = 20;
    restInCircuit = 10;
    numExercisesInCircuit = 4;
  } else if (difficulty == 2) {
    timePerExercise = 20;
    restInCircuit = 30;
    numExercisesInCircuit = 3;
  } else if (difficulty == 1) {
    timePerExercise = 30;
    restInCircuit = 30;
    numExercisesInCircuit = 2;
  } else {
    throw Exception("Invalid difficulty passed into algorithm");
  }

  // convert these to BLOCExercises
  for (int i = 0; i < repoExercises.length; i++) {
    blocExercises[i] = repoExercises[i].convertRepoExerciseToBlocExercise();
    blocExercises[i].exerciseTime = timePerExercise;
  }

  // Populate the list with numCircuits circuits
  for (int i = 0; i < (workoutTime / (5 * SECONDS_PER_MINUTE)); i++) {
    circuits.add(Circuit(
        numExercises: numExercisesInCircuit,
        restTimeInCircuit: restInCircuit,

        // set the length of the exercises list
        exercises: List.filled(numExercisesInCircuit, emptyExercise),
        timesRepeated: timesRepeated,
        restTimeAfterCircuit: restTimeBetweenCircuits));
  }

  for (int i = 0; i < circuits.length; i++) {
    for (int j = 0; j < circuits[i].numExercises; j++) {
      // choose a random exercise from the list of exercises
      randNum = random.nextInt(blocExercises.length);
      circuits[i].exercises[j] = blocExercises[randNum];
    }
  }

  print("The circuits are: " + circuits.toString());

  return circuits;
}
