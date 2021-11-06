part of 'fitness_buddy_database.dart';

// This code, as well as the structure of the functions,
// is copied from https://github.com/ericgrandt/flutter-streams/blob/master/lib/data/database.dart

// Lines 13-25 are copied

class DBProvider {
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

    return await openDatabase(path, version: 1, onOpen: (Database db) async {},
        onCreate: (Database db, int version) async {
      // Create the tables as specified in our ERD using SQLite,
      // you guys know this part. Creates the table when creating the
      // db.
      await db.execute(
          'CREATE TABLE Exercise (exerciseName STRING, exerciseID' +
              ' INTEGER PRIMARY KEY, muscleGroup STRING, secondaryMuscleGroup' +
              ' STRING, equipment STRING, difficulty INTEGER)');

      ('CREATE TABLE MuscleGroup (mucleGroupID INTEGER PRIMARY KEY,' +
          ' muscleGroup_name TEXT)');

      ('CREATE TABLE equipment (eq_id INTEGER PRIMARY KEY, eq_name TEXT)');

      ('CREATE TABLE title (t_id INTEGER PRIMARY KEY, t_name TEXT)');
    });
  }

  // Exercise is the data model in exercise.dart
  insertExercise(Exercise exercise) async {
    // db.insert('exercise', exercise.toJson())
    DBProvider db = await this._database;
    var result = await db.insert(exercise, exercise.toMap());
  }

  getAllExercises() async {}

  getExercise(int exerciseId) async {}

  updateExercise(Exercise exercise) async {
    var db = await this._database;
    var result =
        await db.update(exercise, exercise.toMap(), where: [exerciseID]);
  }

  deleteExercise(int exerciseId) async {
    var db = await this._database;
    int result = await db
        .rawDelete('DELETE FROM Exercise ' + 'WHERE exerciseID = exerciseID');
  }
}
