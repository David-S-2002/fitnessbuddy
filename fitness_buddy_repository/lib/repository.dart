// write the class for the repository here
part of 'fitness_buddy_repository.dart';

class ExerciseRepository {
  DBProvider database;

  ExerciseRepository({required this.database});

  Future<List<Exercise>> selectByMuscleGroup(String muscleGroup) async {
    // await the DB
    // conver the result to a list
    return [];
  }

  Future<List<Exercise>> selectBySecondaryMuscleGroup() async {
    return [];
  }

  Future<List<Exercise>> selectByMuscleGroupAndDifficulty(
      String muscleGroup, Difficulty difficulty) async {
    return [];
  }

  Future<List<Exercise>> selectByDifficulty(Difficulty difficulty) async {
    return [];
  }

  Future<List<Exercise>> getAllExercises() async {
    return [];
  }
}
