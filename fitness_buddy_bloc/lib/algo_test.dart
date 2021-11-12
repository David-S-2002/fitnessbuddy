import 'algorithm.dart';
import 'barrel.dart';
import 'models.dart';
import 'package:fitness_buddy_database/fitness_buddy_database.dart';

void main() {
  DBProvider database = DBProvider.db;
  ExerciseRepository exerciseRepo = ExerciseRepository(database: database);
  Future<List<Circuit>> testList =
      algorithm(5, MuscleGroup.abs, Difficulty.easy, exerciseRepo);
}
