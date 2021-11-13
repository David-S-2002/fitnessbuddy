part of 'fitness_buddy_database.dart';

// This code, as well as the structure of the functions,
// is copied from https://github.com/ericgrandt/flutter-streams/blob/master/lib/data/database.dart

// Lines 13-25 are copied

// Create a provate constructor
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  late Database _database;

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
    String path = join(documentsDir.path, "app.db");

    return await openDatabase(path, version: 1, onOpen: (Database db) async {},
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

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty') values (?, ?, ?, ?,"
          "?, ?)",
          [
            1,
            "Ankle Flexion",
            "Legs",
            "Calves and Shins",
            "Resistance Bands",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            2,
            "Prone (Lying) Hamstrings Curl",
            "Legs",
            "Thighs",
            "Resistance Bands",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [3, "Seated Butterfly Stretch", "Legs", "Thighs", "No Eqipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            4,
            "Push Press",
            "Back",
            "Full/Body/Integrated",
            "Resistance Bands",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            5,
            "Seated High Back Row",
            "Back",
            "Arms",
            "Shoulders",
            "Resistance Bands",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            6,
            "Medicine Ball Push-ups",
            "Abs",
            "Medicine Ball",
            "Resistance Bands",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [7, "V-ups", "Abs", "None", "No Equipment", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [8, "Bent-over Row", "Biceps", "Back/Shoulders", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [9, "Chin-ups", "Biceps", "Arms/Back", "Pull-up Bar", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            10,
            "Rotational Uppercut",
            "Biceps",
            "Arms/Full Body",
            "Dumbbells",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            11,
            "Kneeling Lat Stretch (w/bench)",
            "Shoulders",
            "Back",
            "Bench",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            12,
            "Asynchronous Wave",
            "Full Body/Integrated",
            "None",
            "Heavy Ropes",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            13,
            "Bottom-up Press",
            "Chest",
            "Full Body/Integrated, Shoulders",
            "Kettlebells",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [14, "Deadliftx", "Full Body/Integrated", "None", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            15,
            "Bear Crawl Exercise",
            "Full Body/Integrated",
            "None",
            "No Equipment",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [16, "Diagonal Raise", "Shoulders", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [17, "Swing", "Full Body/Integrated", "None", "Kettlebells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            18,
            "Walking Lunges with Twists",
            "Abs, Butt/Hips",
            "Legs-Thighs",
            "Medicine Ball",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            19,
            "Calf Raise",
            "Legs",
            "Calves and Shins",
            "Weighted Machines/Selectorized",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [20, "Kneeling ABC's", "Abs", "None", "Stability Ball", 1]);

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
  // Insert a new exercise using the insert method
  // Followed the format of:
  // https://pub.dev/packages/sqflite
  Future<Exercise> insertExercise(Exercise exercise) async {
    final db = await database;
    int result = await db.insert("Exercise", exercise.toJson());
    exercise.exerciseId = result;
    return exercise;
  }

  // Display all the exercises
  Future<List<Exercise>> getAllExercises() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query("Exercise", columns: [
      "exerciseID",
      "exerciseName",
      "muscleGroup",
      "secondaryMuscleGroup",
      "equipment",
      "difficulty"
    ]);

    List<Exercise> exerciseList = [];

    for (int i = 0; i < result.length; i++) {
      // convert the list of maps to a list of exercises
      exerciseList[i] = Exercise.fromJson(result[i]);
    }

    return exerciseList;
  }

  // Get one exercise based on exercise ID
  Future<Exercise?> getExercise(int exerciseId) async {
    final db = await database;
    List<Map<String, Object?>> results = await db.query("Exercise",
        columns: [
          "exerciseID",
          "exerciseName",
          "muscleGroup",
          "secondaryMuscleGroup",
          "equipment",
          "difficulty"
        ],
        where: 'exerciseID = ?',
        whereArgs: [exerciseId]);

    if (results.isNotEmpty) {
      return Exercise.fromJson(results.first);
    }
    return null;
  }

  // for now only selects by muscle group. I will need help with this.
  Future<List<Exercise>?> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    final Database db = await database;
    List<Exercise> exerciseList = [];

    List<Map<String, Object?>> results = await db.query("Exercise",
        columns: [
          "exerciseID",
          "exerciseName",
          "muscleGroup",
          "secondaryMuscleGroup",
          "equipment",
          "difficulty"
        ],
        where: 'muscleGroup = ?',
        whereArgs: [muscleGroup]);

    if (results.isNotEmpty) {
      for (int i = 0; i < results.length; i++) {
        exerciseList[i] = Exercise.fromJson(results[i]);
      }

      return exerciseList;
    }
    return null;
  }

  // Update an exercise
  Future<int> updateExercise(Exercise exercise) async {
    final db = await database;

    return await db.update("Exercise", exercise.toJson(),
        where: "exerciseID = ?", whereArgs: [exercise.exerciseId]);
  }

  // Delete an exercise
  Future<int> deleteExercise(int exerciseId) async {
    final db = await database;

    return await db
        .delete("Exercise", where: "exerciseID = ?", whereArgs: [exerciseId]);
  }
}
