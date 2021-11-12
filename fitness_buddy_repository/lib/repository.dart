part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<Exercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    // This is temporary until we implement this function.
    // Returning a hardcoded list of exercises for now.
    return [
      Exercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 15,
          exerciseName: "Deadlift"),
      Exercise(
          difficulty: 2,
          muscleGroup: "Back",
          secondaryMuscleGroup: "Butt/Hips",
          equipment: "Dumbbells",
          exerciseId: 16,
          exerciseName: "Front Squat"),
      Exercise(
        exerciseId: 17,
        exerciseName: "Push-up with Single-leg Raise",
        difficulty: 3,
        muscleGroup: "Arms",
        secondaryMuscleGroup: "Butt/Hips",
        equipment: "None",
      ),
      Exercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 18,
          exerciseName: "Push Press"),
      Exercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 19,
          exerciseName: "Power Clean"),
      Exercise(
          difficulty: 3,
          muscleGroup: "Abs",
          secondaryMuscleGroup: "Butt/Hips",
          equipment: "None",
          exerciseId: 20,
          exerciseName: "Lunge with Elbow Instep"),
    ];
  }

  Future<List<Map<String, Object?>>?> getAllExercises() async {
    return (await database.getAllExercises());
  }
}
