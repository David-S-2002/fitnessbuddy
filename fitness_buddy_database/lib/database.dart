part of 'fitness_buddy_database.dart';

// This code, as well as the structure of the functions,
// is copied from https://github.com/ericgrandt/flutter-streams/blob/master/lib/data/database.dart

// Lines 9-32 are copied

// Create a private constructor
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  late Database _database;

  // Set-up the database
  Future<Database> get database async {
    // If database is null, instantiate it
    _database = await initDB();
    return _database;
  }

  Future<void> insertExercises() async {}

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

      await insertExercises();

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty') values (?, ?, ?, ?,"
          "?, ?)",
          [
            1,
            "Ankle Flexion",
            "Legs/Butt/Hips",
            "none",
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
            "Legs/Butt/Hips",
            "none",
            "Resistance Bands",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            3,
            "Seated Butterfly Stretch",
            "Legs/Butt/Hips",
            "None",
            "No Equipment",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            4,
            "Push Press",
            "Back",
            "Full Body/Integrated",
            "Resistance Bands",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [5, "Seated Row", "Back", "Arms", "Resistance Bands", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [6, "Medicine Ball Push-ups", "Abs", "none", "Resistance Bands", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [7, "V-ups", "Abs", "None", "No Equipment", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [8, "Bent-over Row", "Arms", "Back", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [9, "Chin-ups", "Arms", "Back", "Pull-up Bar", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            10,
            "Rotational Uppercut",
            "Arms",
            "Full Body/Integrated",
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
            "Full Body/Integrated",
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
            "Abs",
            "Legs/Butt/Hips",
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
            "Legs/Butt/Hips",
            "None",
            "Weight Machines/Selectorized",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [20, "Kneeling ABC's", "Abs", "None", "Stability Ball", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            21,
            "Forward Linear Ladder Drill",
            "Abs",
            "Full Body/Integrated",
            "Ladder",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [22, "Glute Activation Lunges", "Abs", "Legs/Butt/Hips", "None", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [23, "Inverted Flyers", "Abs", "Legs/Butt/Hips", "None", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [24, "Side Plank (modified)", "Abs", "Legs/Butt/Hips", "None", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [25, "Side-lying Arm Rolls", "Abs", "Shoulders", "Dumbbells", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [26, "Spider Walks", "Arms", "Full Body/Integrated", "None", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            27,
            "Supine Snow Angel (Wipers) Exercise",
            "Abs",
            "Chest",
            "None",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            28,
            "Prone Scapular (Shoulder) Stabilization Series - I, Y, T",
            "Back",
            "Shoulders",
            "None",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [29, "Shoulder Packing", "Back", "Shoulders", "None", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [30, "Shrug", "Back", "None", "Barbell", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            31,
            "Double Rotation Waves",
            "Full Body/Integrated",
            "None",
            "Heavy Ropes",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [32, "Forward Hurdle Run", "Legs/Butt/Hips", "None", "Hurdles", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [33, "Shrug", "Back", "None", "Barbell", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            34,
            "Box Jumps",
            "Legs/Butt/Hips",
            "None",
            "Raised Platform/Box",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            35,
            "Lateral Over Unders",
            "Abs",
            "Legs/Butt/Hips",
            "Raised Platform/Box",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            36,
            "Single Leg Push-off",
            "Legs/Butt/Hips",
            "None"
                "Raised Platform/Box",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            37,
            "Forward Stepping Over Cones",
            "Abs",
            "Legs/Butt/Hips",
            "Cones",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [38, "T Drill", "Full Body/Integrated", "None", "Cones", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            39,
            "Single Leg Hamstring Curl",
            "Legs/Butt/Hips",
            "None",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            40,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [41, "Bent Knee Push-up", "Arms", "Chest", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [42, "Barbell Chest Press", "Arms", "Chest", "Barbell", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [43, "Lying Chest Fly", "Chest", "Shoulders", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [44, "Lying Pullovers", "Chest", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            45,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            46,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            47,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            48,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            49,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            50,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            51,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            52,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            53,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            54,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            55,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            56,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            57,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            58,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            59,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            60,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            61,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            62,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            63,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            64,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            65,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            66,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            67,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            68,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            69,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup', "
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            70,
            "Stability Ball Reverse Extensions",
            "Back",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [45, "90 Lat Stretch", "Back", "None", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [46, "Cat-Cow", "Back", "Chest", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [47, "Cobra Exercise", "Abs", "Back", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            48,
            "Contralateral Limb Raises",
            "Back",
            "Legs/Butt/Hips",
            "No Equipment",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [49, "Jump and Reach", "Legs/Butt/Hips", "Legs", "No Equipment", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            50,
            "Lateral Crawls",
            "Full Body/Integrated",
            "None",
            "No Equipment",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            51,
            "Seated Chest Press",
            "Chest",
            "None",
            "Weight Machines / Selectorized",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            52,
            "Anti-Rotation Reverse Lunge",
            "Full Body/Integrated",
            "None",
            "Resistance Bands/Cables",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            53,
            "Rotational Overhead Press",
            "Shoulders",
            "None",
            "Dumbbells",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            54,
            "Lunge with Overhead Press",
            "Shoulders",
            "Abs",
            "Medicine Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [55, "Dumbbell Lateral Raise", "Shoulders", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [56, "Dumbbell Front Raise", "Shoulders", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            57,
            "High Plank T-spine Rotation",
            "Abs",
            "Shoulders",
            "No Equipment",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            58,
            "Push-up with Single-leg Raise",
            "Arms",
            "Legs/Butt/Hips",
            "No Equipment",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            59,
            "Standing Shoulder Press with Barbell",
            "Arms",
            "Shoulders",
            "Barbell",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            60,
            "Push-up with Staggered Hands",
            "Arms",
            "Chest",
            "No Equipment",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [61, "Barbell Bicep Curl", "Arms", "None", "Barbell", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            62,
            "Traditional Bicep Curl with Dumbbells",
            "Arms",
            "None",
            "Dumbbells",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [63, "Hammer Curl", "Arms", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [64, "Bent Knee Push-up", "Arms", "Chest", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [65, "Front Squat", "Back", "Legs/Butt/Hips", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            66,
            "Kneeling Lat Pulldown",
            "Back",
            "None",
            "Resistance Bands/Cables",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            67,
            "Kneeling Reverse Fly",
            "Back",
            "Shoulders",
            "Resistance Bands/Cables",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            68,
            "Lying Barbell Triceps Extensions",
            "Arms",
            "None",
            "Barbell",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [69, "Pull-ups", "Arms", "Back", "Pull-up bar", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [70, "Barbell Jammers", "Abs", "Legs/Butt/Hips", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [71, "Side Plank", "Abs", "Legs/Butt/Hips", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [72, "Standing Wood Chop", "Abs", "None", "Medicine Ball", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [73, "Dirty Dog", "Abs", "Legs/Butt/Hips", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [74, "Triceps Extension", "Arms", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [75, "Wrist Curl-Flexion", "Arms", "None", "Bench, Dumbbells", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [76, "Plank-Ups", "Abs", "Arms", "No Equipment", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [77, "Halo", "Full Body/Integrated", "None", "Kettlebells", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            78,
            "Bottom-Up Press",
            "Full Body/Integrated",
            "None",
            "Kettlebells",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            79,
            "Stability Ball Knee Tucks",
            "Abs",
            "Legs/Butt/Hips",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            80,
            "Standing Ankle Mobilization",
            "Legs/Butt/Hips",
            "None",
            "No Equipment",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            81,
            "Supine Hamstring Stretch",
            "Legs/Butt/Hips",
            "None",
            "No Equipment",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [82, "Lateral Zig Zags", "Legs/Butt/Hips", "None", "Cones", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            83,
            "Step Stretch",
            "Legs/Butt/Hips",
            "None",
            "Raised Platform/Box",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            84,
            "Glute Activation Lunges",
            "Legs/Butt/Hips",
            "Abs",
            "No Equipment",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [85, "Half-Kneeling Hay Baler", "Abs", "None", "Medicine Ball", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            86,
            "Standing Trunk Rotation",
            "Abs",
            "None",
            "Resistance Bands/Cables",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [87, "Supine Dead Bugs", "Abs", "None", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            88,
            "Standing Gate Openers",
            "Legs/Butt/Hips",
            "Abs",
            "No Equipment",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            89,
            "Stability Ball Pikes",
            "Abs",
            "Shoulders",
            "Stability Ball",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [90, "Roll Out", "Abs", "None", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            91,
            "Seated Crunch",
            "Abs",
            "None",
            "Weight Machines/Selectorized",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [92, "Side-lying Arm Rolls", "Abs", "Shoulders", "Dumbbells", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [93, "Bird-dog", "Legs/Butt/Hips", "Abs", "No Equipment", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            94,
            "Bulgarian Split Squat",
            "Legs/Butt/Hips",
            "None",
            "Bench/Dumbbells",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            95,
            "Mountain Climbers",
            "Legs/Butt/Hips",
            "Full Body Integrated",
            "No Equipment",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            96,
            "Partner Tricep Extension",
            "Legs/Butt/Hips",
            "Arms",
            "Resistance Bands/Cables",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            97,
            "Pistol Squat Workout",
            "Legs/Butt/Hips",
            "None",
            "BOSU Trainer",
            3
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [98, "Squat Jumps", "Legs/Butt/Hips", "None", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [99, "Supermans", "Legs/Butt/Hips", "Shoulders", "No Equipment", 1]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            100,
            "Supine Shoulder Roll",
            "Legs/Butt/Hips",
            "Abs",
            "Stability Ball",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [101, "High Plank Renegade Row", "Abs", "Back", "Dumbbells", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            102,
            "Romanian Deadlift with Barbell",
            "Back",
            "Legs/Butt/Hips",
            "Barbell",
            2
          ]);
      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            103,
            "Romanian Deadlift with Dumbbells",
            "Back",
            "Legs/Butt/Hips",
            "Dumbbells",
            2
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [104, "Goblet Squat", "Legs/Butt/Hips", "None", "Dumbbells", 2]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [105, "Front Plank", "Abs", "Back", "No Equipment", 2]);
      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [106, "Modified Plank", "Abs", "None", "No Equipment", 1]);
      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            107,
            "Bodyweight Squat",
            "Abs",
            "Legs/Butt/Hips",
            "No Equipment",
            1
          ]);
      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [108, "Back Squat", "Legs/Butt/Hips", "None", "Barbell", 3]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            109,
            "Seated Machine Close-Grip Shoulder Press",
            "Arms",
            "Shoulders",
            "Weight Machines / Selectorized",
            1
          ]);

      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            110,
            "Forward Linear Jumps",
            "Full Body/Integrated",
            "Legs/Butt/Hips",
            "No Equipment",
            1
          ]);
      await db.execute(
          "INSERT INTO Exercise ('exerciseID', 'exerciseName', 'muscleGroup',"
          "'secondaryMuscleGroup', 'equipment', 'difficulty')"
          "values (?, ?, ?, ?, ?, ?)",
          [
            111,
            "Warrior I",
            "Full Body/Integrated",
            "Legs/Butt/Hips",
            "No Equipment",
            1
          ]);

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

  // note to self: Try to figure out secondary muscle tomorrow morning
  Future<List<Exercise>?> selectByMuscleGroupAndDifficulty(
      String muscleGroup, int difficulty) async {
    final Database db = await database;
    List<Exercise> exerciseList = [];
    Exercise currentExercise;

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
        currentExercise = Exercise.fromJson(results[i]);

        if (currentExercise.difficulty == difficulty) {
          exerciseList.add(currentExercise);
        }
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
