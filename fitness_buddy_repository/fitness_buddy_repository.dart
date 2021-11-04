// write the class for the repository here
import '../fitness_buddy_database/database.dart';
import 'models.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<Exercise>> selectByMuscleGroup(String muscleGroup) {
    // await the DB
    // conver the result to a list
    return [];
  }

  Future<List<Exercise>> selectBySecondaryMuscleGroup() {
    return [];
  }

  Future<List<Exercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, Difficulty difficulty) {}

  Future<List<Exercise>> selectByDifficulty(Difficulty difficulty) {
    return [];
  }

  Future<List<Exercise>> getAllExercises() {
    return [];
  }
}
