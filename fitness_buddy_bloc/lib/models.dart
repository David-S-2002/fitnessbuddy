import 'barrel.dart';

enum Difficulty { easy, medium, hard, uninitialized }
enum MuscleGroup {
  abs,
  arms,
  back,
  buttAndHips,
  chest,
  fullBodyOrIntegrated,
  legsCalvesAndShins,
  shoulders,
  legsThighs,
  uninitialized
}

class BLOCExercise {
  String exerciseName;
  double exerciseTime;
  String equipment;
  MuscleGroup primaryMuscleGroup;
  MuscleGroup? secondaryMuscleGroup;
  Difficulty difficulty;

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

  // BLOCExercise convertToBlocExercise(ExerciseRepository repository) {
  //   BLOCExercise blocExercise = BLOCExercise(
  //       exerciseName: exercise.exerciseName,
  //       exerciseTime: -1,
  //       equipment: exercise.equipment,
  //       primaryMuscleGroup: MuscleGroup.uninitialized,
  //       secondaryMuscleGroup: MuscleGroup.uninitialized,
  //       difficulty: Difficulty.uninitialized);
  //   if (exercise.difficulty == 1) {
  //     blocExercise.difficulty = Difficulty.easy;
  //   } else if (exercise.difficulty == 2) {
  //     blocExercise.difficulty = Difficulty.medium;
  //   } else if (exercise.difficulty == 3) {
  //     blocExercise.difficulty = Difficulty.hard;
  //   }
  //   if (exercise.primaryMuscleGroup == MuscleGroup.abs) {}
  //   return blocExercise;
  // }
}

// A Circuit is a group of exercises that are performed all in a row without
// rest time in between, and then rest time is given at the end.
// The total time will be the time of all the exercises (we already know this
// from the List<Exercise>) plus the rest time.
// The difficulty will determine the rest time.

class Circuit {
  List<BLOCExercise> exercises;
  double restTime;
  int timesRepeated;

  Circuit(
      {required this.exercises,
      required this.restTime,
      required this.timesRepeated});

  @override
  String toString() =>
      "Circuit: Exercises: " +
      exercises.toString() +
      ". Rest time: " +
      restTime.toString() +
      ". Times repeated: " +
      timesRepeated.toString();
}
