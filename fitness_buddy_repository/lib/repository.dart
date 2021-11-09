part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<Exercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    return [];
  }

  Future<List<Exercise>> getAllExercises() async {
    return [];
  }
}
