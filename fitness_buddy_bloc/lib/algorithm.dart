import 'barrel.dart';

// Fill the time intervals we have determined with the exercises, randomly chosen

// Once an exercise has been chosen, remove it from the list of possible exercises

Future<List<Circuit>> algorithm(int workoutTime, String muscleGroup,
    int difficulty, ExerciseRepository repository) async {
  List<Circuit> circuits = [];
  List<RepoExercise> repoExercises = [];
  List<BLOCExercise> blocExercises = [];
  double circuitTimePlusRest = 5;
  double restTimeBetweenCircuits = 0.5;

  int timesRepeated = 3; // how many times one circuit is repeated
  double timePerExercise; // duration of one exercise
  double restInCircuit; // rest time WITHIN the circuit
  int numExercisesInCircuit;

  // Initialize these to different values depending on the difficulty:
  if (difficulty == 3) {
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = (1 / 6); // 10 seconds
    numExercisesInCircuit = 4;
  } else if (difficulty == 2) {
    timePerExercise = (1 / 3); // 20 sec
    restInCircuit = 0.5; // 30 sec
    numExercisesInCircuit = 3;
  } else if (difficulty == 1) {
    timePerExercise = 0.5;
    restInCircuit = 0.5;
    numExercisesInCircuit = 2;
  } else {
    print("Invalid difficulty");
    throw Exception("Invalid difficulty passed into algorithm");
  }

  // Populate the list with numCircuits circuits
  for (int i = 0; i <= (workoutTime / 5 as int); i++) {
    circuits.add(Circuit(
        numExercises: numExercisesInCircuit,
        restTimeInCircuit: restInCircuit,
        exercises: [],
        timesRepeated: timesRepeated,
        restTimeAfterCircuit: restTimeBetweenCircuits));
  }

  // get all the possible exercises from the repository:
  repoExercises = await repository.selectByMuscleGroupAndDifficulty(
      muscleGroup, difficulty);

  // convert these to BLOCExercises
  for (int i = 0; i < repoExercises.length; i++) {
    blocExercises[i] = repoExercises[i].convertRepoExerciseToBlocExercise();
  }

  // Populate each circuit by picking randomly from these exercises.
  // For now we have circuits with empty exercises
  print(circuits);
  return circuits;
}
