// TODO: Make the models JSON Serializable
// and implement fromJson, toJson, anything else necessary
// to convert between the BLOC/UI model and repository model

// Which muscle groups should we use?
// This should probably go in the repository or elsewhere
enum MuscleGroup { arms, shoulders, chest, back, abs, legs }
enum Difficulty { easy, medium, hard }

// For each exercise, I was thinking we will display on the screen the time duration, the
// equipment required, and the muscle group(s) exercised.

// I was thinking that difficulty will be determined by the amount of rest time
// in the entire workout?
// Also we could use heavier dumbbells for more difficulty. This would change the equipment.

// IDK if we should have a primary muscle group and a secondary muscle group,
// instead of a List<MuscleGroup>

class Exercise {
  DateTime exerciseTime;
  String equipment; // have an enum?
  List<MuscleGroup> muscleGroups;
  Difficulty difficulty;

  Exercise(
      {required this.exerciseTime,
      required this.equipment,
      required this.muscleGroups,
      required this.difficulty});
}

// A Circuit is a group of exercises that are performed all in a row without
// rest time in between, and then rest time is given at the end.
// A strength workout often consists of several circuits (or EMOMs or AMRAPs -
// we can discuss if we want to do that).
// The total time will be the time of all the exercises (we already know this
// from the List<Exercise>) plus the rest time.
// The difficulty will determine the rest time.

class Circuit {
  List<Exercise> exercises;
  Difficulty difficulty;
  DateTime restTime;

  Circuit(
      {required this.exercises,
      required this.difficulty,
      required this.restTime});
}
