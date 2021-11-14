part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  // only selects by muscle group for now
  // will need help with selecting by difficulty
  Future<List<RepoExercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    List<Exercise>? dbExercises = await database
        .selectByMuscleGroupAndDifficulty(muscleGroup, difficulty);
    List<RepoExercise>? repoExercises = [];

    if (dbExercises != null) {
      for (int i = 0; i < dbExercises.length; i++) {
        repoExercises[i].convertDbExerciseToRepoExercise(dbExercises[i]);
      }
    }

    return repoExercises;
  }

  Future<List<RepoExercise>> selectByMuscleGroupAndDifficultyHardcoded(
      String muscleGroup, int difficulty) async {
    return [
      RepoExercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 15,
          exerciseName: "Deadlift"),
      RepoExercise(
          difficulty: 2,
          muscleGroup: "Back",
          secondaryMuscleGroup: "Butt/Hips",
          equipment: "Dumbbells",
          exerciseId: 16,
          exerciseName: "Front Squat"),
      RepoExercise(
        exerciseId: 17,
        exerciseName: "Push-up with Single-leg Raise",
        difficulty: 3,
        muscleGroup: "Arms",
        secondaryMuscleGroup: "Butt/Hips",
        equipment: "None",
      ),
      RepoExercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 18,
          exerciseName: "Push Press"),
      RepoExercise(
          difficulty: 3,
          muscleGroup: "Full Body/Integrated",
          secondaryMuscleGroup: null,
          equipment: "barbell",
          exerciseId: 19,
          exerciseName: "Power Clean"),
      RepoExercise(
          difficulty: 3,
          muscleGroup: "Abs",
          secondaryMuscleGroup: "Butt/Hips",
          equipment: "None",
          exerciseId: 20,
          exerciseName: "Lunge with Elbow Instep"),
    ];
  }

  Future<List<RepoExercise>> getAllRepoExercises() async {
    List<Exercise> dbExercises = await database.getAllExercises();
    List<RepoExercise> repoExercises = [];

    for (int i = 0; i < dbExercises.length; i++) {
      repoExercises[i].convertDbExerciseToRepoExercise(dbExercises[i]);
    }

    return repoExercises;
  }
}
