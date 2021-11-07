enum MuscleGroup { arms, shoulders, chest, back, abs, legs }
enum Difficulty { easy, medium, hard }

class Exercise {
  String exerciseName;
  double exerciseTime;
  String equipment;
  MuscleGroup primaryMuscleGroup;
  MuscleGroup secondaryMuscleGroup;
  Difficulty difficulty;

  Exercise(
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
  List<Exercise> exercises;
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
