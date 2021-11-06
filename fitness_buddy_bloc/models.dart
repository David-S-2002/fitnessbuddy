// TODO: Make the models JSON Serializable
// and implement fromJson, toJson, anything else necessary
// to convert between the BLOC/UI model and repository model

// Which muscle groups should we use?
// This should probably go in the repository or elsewhere
enum MuscleGroup { arms, shoulders, chest, back, abs, legs }
enum Difficulty { easy, medium, hard }

// IDK if we should have a primary muscle group and a secondary muscle group,
// instead of a List<MuscleGroup>

class Exercise {
  String exerciseName;
  DateTime exerciseTime;
  String equipment; // have an enum?
  List<MuscleGroup> muscleGroups;
  Difficulty difficulty;

  Exercise(
      {required this.exerciseName,
      required this.exerciseTime,
      required this.equipment,
      required this.muscleGroups,
      required this.difficulty});
}

// A Circuit is a group of exercises that are performed all in a row without
// rest time in between, and then rest time is given at the end.
// The total time will be the time of all the exercises (we already know this
// from the List<Exercise>) plus the rest time.
// The difficulty will determine the rest time.

class Circuit {
  List<Exercise> exercises;
  DateTime restTime;

  Circuit({required this.exercises, required this.restTime});
}
