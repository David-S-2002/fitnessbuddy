import 'package:sqflite/sqflite.dart';

import 'algorithm.dart';
import 'barrel.dart';
import 'models.dart';

void main() {
  DBProvider database = DBProvider.db;
  ExerciseRepository exerciseRepo = ExerciseRepository(database: database);
  Future<List<Circuit>> testList =
      algorithm(5, MuscleGroup.abs, Difficulty.easy, exerciseRepo);
}
