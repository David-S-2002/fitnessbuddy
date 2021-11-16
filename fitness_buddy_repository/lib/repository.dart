part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<RepoExercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    print("In repo select funtion");
    List<Exercise>? dbExercises = await database
        .selectByMuscleGroupAndDifficulty(muscleGroup, difficulty);
    print("Returned from the db select function");
    List<RepoExercise>? repoExercises = [];

    if (dbExercises != null) {
      for (int i = 0; i < dbExercises.length; i++) {
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
