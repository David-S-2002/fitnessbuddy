class BLOCExercise {
  String exerciseName;
  double exerciseTime;
  String equipment;
  String primaryMuscleGroup;
  String? secondaryMuscleGroup;
  int difficulty;

  BLOCExercise(
      {required this.exerciseName,
      required this.exerciseTime,
      required this.equipment,
      required this.primaryMuscleGroup,
      required this.secondaryMuscleGroup,
      required this.difficulty});

  @override
  String toString() =>
      "Exercise: Name: " +
      exerciseName +
      ". Time: " +
      exerciseTime.toString() +
      ". Equipment: " +
      equipment +
      ". Primary muscle group: " +
      primaryMuscleGroup.toString() +
      ". Secondary muscle group: " +
      secondaryMuscleGroup.toString() +
      ". Difficulty: " +
      difficulty.toString();
}

// A Circuit is a group of exercises that are performed all in a row without
// rest time in between, and then rest time is given at the end.
// The total time will be the time of all the exercises (we already know this
// from the List<Exercise>) plus the rest time.
// The difficulty will determine the rest time.

class Circuit {
  int numExercises;
  List<BLOCExercise> exercises;
  double restTimeInCircuit;
  double restTimeAfterCircuit;
  int timesRepeated;

  Circuit(
      {required this.exercises,
      required this.numExercises,
      required this.restTimeInCircuit,
      required this.timesRepeated,
      required this.restTimeAfterCircuit});

  @override
  String toString() =>
      "Circuit: Number of exercises: " +
      numExercises.toString() +
      "Exercises: " +
      exercises.toString() +
      ". Rest time in circuit: " +
      restTimeInCircuit.toString() +
      ". Rest time after circuit: " +
      restTimeAfterCircuit.toString() +
      ". Times repeated: " +
      timesRepeated.toString();
}
