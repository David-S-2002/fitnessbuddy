class BLOCExercise {
  String exerciseName;
  double exerciseTime;
  String equipment;
  String primaryMuscleGroup;
  String? secondaryMuscleGroup;
  int? difficulty;

  BLOCExercise(
      {required this.exerciseName,
      required this.exerciseTime,
      required this.equipment,
      required this.primaryMuscleGroup,
      required this.secondaryMuscleGroup,
      required this.difficulty});

  static BLOCExercise emptyExercise = BLOCExercise(
      exerciseName: "",
      exerciseTime: -1,
      equipment: "",
      primaryMuscleGroup: "",
      secondaryMuscleGroup: "",
      difficulty: -1);

  @override
  String toString() =>
      "Exercise: Name: " +
      exerciseName +
      ". Time: " +
      exerciseTime.toString() +
      ". Equipment: " +
      equipment +
      ". Primary muscle group: " +
      primaryMuscleGroup.toString() +
      ". Secondary muscle group: " +
      secondaryMuscleGroup.toString() +
      ". Difficulty: " +
      difficulty.toString();
}

class Circuit {
  int numExercises;
  List<BLOCExercise> exercises;
  double restTimeInCircuit;
  double restTimeAfterCircuit;
  int timesRepeated;

  Circuit(
      {required this.exercises,
      required this.numExercises,
      required this.restTimeInCircuit,
      required this.timesRepeated,
      required this.restTimeAfterCircuit});

  @override
  String toString() =>
      "Circuit: Number of exercises: " +
      numExercises.toString() +
      "Exercises: " +
      exercises.toString() +
      ". Rest time in circuit: " +
      restTimeInCircuit.toString() +
      ". Rest time after circuit: " +
      restTimeAfterCircuit.toString() +
      ". Times repeated: " +
      timesRepeated.toString();
}

BLOCExercise emptyExercise = BLOCExercise(
    exerciseName: "",
    exerciseTime: 0,
    equipment: "",
    primaryMuscleGroup: "",
    secondaryMuscleGroup: "",
    difficulty: -1);

Circuit emptyCircuit = Circuit(
    exercises: [],
    numExercises: 0,
    restTimeInCircuit: 0,
    timesRepeated: 0,
    restTimeAfterCircuit: 0);
