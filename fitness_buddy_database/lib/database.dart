part of 'fitness_buddy_database.dart';

// This code, as well as the structure of the functions,
// is copied from https://github.com/ericgrandt/flutter-streams/blob/master/lib/data/database.dart

// Lines 13-25 are copied

// Create a provate constructor
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database _database;

  // Set-up the database
  Future<Database> get database async {
    if (_database != null) return _database;

    // If database is null, instantiate it
    _database = await initDB();
    return _database;
  }

  // open and create the DB
  initDB() async {
    // Access the directory where documents for this app are stored
    Directory documentsDir = await getApplicationDocumentsDirectory();

    // path of database: it's inside that directory
    String path = join(documentsDir.path, "fitnessbuddy.db");

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // Create the tables as specified in our ERD using SQLite.
      // Creates the tables when creating the db.

      await db.execute("CREATE TABLE Exercise ("
          "exerciseID INTEGER PRIMARY KEY,"
          "exerciseName TEXT,"
          "muscleGroup TEXT,"
          "secondaryMuscleGroup TEXT,"
          "equipment TEXT,"
          "difficulty INTEGER"
          ")");

      await db.execute("CREATE TABLE MuscleGroup ("
          "mucleGroupID INTEGER PRIMARY KEY,"
          "muscleGroup_name TEXT"
          ")");

      await db.execute("CREATE TABLE Equipment ("
          "equipmentID INTEGER PRIMARY KEY,"
          "eq_name TEXT"
          ")");

      await db.execute("CREATE TABLE Title ("
          "titleID INTEGER PRIMARY KEY,"
          "titleNameTEXT"
          ")");
    });
  }

  // Exercise is the data model in exercise.dart
  Future<int> insertExercise(Exercise exercise) async {
    // db.insert('exercise', exercise.toJson())
    var result = await db.insert("Exercise", exercise.toJson());
  }

  Future<List> getAllExercises() async {
    var result = await db.query("Exercise", columns: [
      "exerciseID",
      " exerciseName",
      "muscleGroup",
      "secondaryMuscleGroup",
      "equipment",
      " difficulty"
    ]);

    return result.toJson();
  }

  Future<Exercise> getExercise(int exerciseId) async {
    List<Json> results = await db.query("Exercise",
        columns: [
          "exerciseID",
          "exerciseName",
          "muscleGroup",
          "secondaryMuscleGroup",
          "equipment",
          "difficulty"
        ],
        where: 'exerciseID = ?',
        whereArgs: [exerciseID]);

    if (results.length > 0) {
      return new Exercise.fromJson(results.first);
    }
    return null;
  }

  Future<int> updateExercise(Exercise exercise) async {
    return await db.update("Exercise", exercise.toJson(),
        where: "exerciseID" + " = ?", whereArgs: [exerciseID]);
  }

  Future<int> deleteExercise(int exerciseId) async {
    return await db
        .delete("Exercise", where: "exerciseID = ?", whereArgs: [exerciseID]);
  }
}
