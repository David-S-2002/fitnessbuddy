part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<RepoExercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    List<Exercise>? dbExercises = await database
        .selectByMuscleGroupAndDifficulty(muscleGroup, difficulty);

    // fill the list with empty exercises. Avoids index range errors
    List<RepoExercise>? repoExercises = List<RepoExercise>.filled(
        dbExercises!.length,
        RepoExercise(
            difficulty: -1,
            equipment: "",
            exerciseId: -1,
            exerciseName: "",
            muscleGroup: "",
            secondaryMuscleGroup: ""));

    if (dbExercises.isNotEmpty) {
      for (int i = 0; i < dbExercises.length; i++) {
        repoExercises[i] =
            repoExercises[i].convertDbExerciseToRepoExercise(dbExercises[i]);
      }
    }

    return repoExercises;
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
