import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'exercise.dart';

// This code, as well as the structure of the functions,
// is copied from https://github.com/ericgrandt/flutter-streams/blob/master/lib/data/database.dart

// Lines 13-25 are copied

class DBProvider{
  DBProvider._();
  static final DBProvider db = DBProvider._();
	Database _database;

  Future<Database> get database async {
		if (_database != null) {
			return _database;
		}

		_database = await initDB();
		return _database;
	}

  // open and create the DB
  initDB() async {
    // Access the directory where documents for this app are stored
    Directory documentsDir = await getApplicationDocumentsDirectory();

    // path of database: it's inside that directory
    String path = join(documentsDir.path, 'fitnessbuddy.db');

    return await openDatabase(path, version: 1, onOpen: (Database db) async {
      }, onCreate: (Database db, int version) async{
        // Create the tables as specified in our ERD using SQLite,
        // you guys know this part.
      }
  }

  // Exercise is the data model in exercise.dart
  insertExercise(Exercise exercise) async{
    // db.insert('exercise', exercise.toJson())
  }

  getAllExercises() async{

  }

  getExercise(int exerciseId) async{

  }

  updateExercise(Exercise exercise) async{

  }

  deleteExercise(int exerciseId) async{

  }
}