// any/all models that the repository uses go here

// format copied from
// https://github.com/ericgrandt/flutter-streams/blob/master/lib/models/note_model.dart

// If you annotate an object with @JSON Serializable, and you run build_runner, then
// a generated file (exercise.g.dart, in this case) will make the object
// JSON serializable so you don't have to do it manually.

// I tried to run build_runner but it didn't work; I'll come back to it later

import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:fitness_buddy_bloc/barrel.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  String exerciseName;
  int exerciseId;
  String muscleGroup;
  String? secondaryMuscleGroup;
  String equipment;
  int difficulty;

  Exercise(
      {required this.exerciseName,
      required this.exerciseId,
      required this.muscleGroup,
      required this.secondaryMuscleGroup,
      required this.equipment,
      required this.difficulty});

  // I didn't use fromJson and toJson for this because the fields in the
  // models were different.

  BLOCExercise convertRepoExerciseToBlocExercise(Exercise repoExercise) {
    BLOCExercise blocExercise = BLOCExercise(
        exerciseName: repoExercise.exerciseName,
        exerciseTime: -1,
        equipment: repoExercise.equipment,
        primaryMuscleGroup: MuscleGroup.uninitialized,
        secondaryMuscleGroup: MuscleGroup.uninitialized,
        difficulty: Difficulty.uninitialized);

    if (repoExercise.difficulty == 1) {
      blocExercise.difficulty = Difficulty.easy;
    } else if (repoExercise.difficulty == 2) {
      blocExercise.difficulty = Difficulty.medium;
    } else if (repoExercise.difficulty == 3) {
      blocExercise.difficulty = Difficulty.hard;
    }

    if (repoExercise.muscleGroup.toLowerCase() == "abs") {
      blocExercise.primaryMuscleGroup = MuscleGroup.abs;
    } else if (repoExercise.muscleGroup.toLowerCase() == "arms") {
      blocExercise.primaryMuscleGroup = MuscleGroup.arms;
    } else if (repoExercise.muscleGroup.toLowerCase() == "back") {
      blocExercise.primaryMuscleGroup = MuscleGroup.back;
    } else if (repoExercise.muscleGroup.toLowerCase() == "butt/hips") {
      blocExercise.primaryMuscleGroup = MuscleGroup.buttAndHips;
    } else if (repoExercise.muscleGroup.toLowerCase() == "chest") {
      blocExercise.primaryMuscleGroup = MuscleGroup.chest;
    } else if (repoExercise.muscleGroup.toLowerCase() ==
        "full body/integrated") {
      blocExercise.primaryMuscleGroup = MuscleGroup.fullBodyOrIntegrated;
    } else if (repoExercise.muscleGroup.toLowerCase() ==
        "legs - calves and shins") {
      blocExercise.primaryMuscleGroup = MuscleGroup.legsCalvesAndShins;
    } else if (repoExercise.muscleGroup.toLowerCase() == "shoulders") {
      blocExercise.primaryMuscleGroup = MuscleGroup.shoulders;
    } else if (repoExercise.muscleGroup.toLowerCase() == "legs - thighs") {
      blocExercise.primaryMuscleGroup = MuscleGroup.legsThighs;
    } else {
      throw Exception("Invalid primary muscle group in repository exercise");
    }

    if (repoExercise.secondaryMuscleGroup?.toLowerCase() == "abs") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.abs;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() == "arms") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.arms;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() == "back") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.back;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() ==
        "butt/hips") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.buttAndHips;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() == "chest") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.chest;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() ==
        "full body/integrated") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.fullBodyOrIntegrated;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() ==
        "legs - calves and shins") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.legsCalvesAndShins;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() ==
        "shoulders") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.shoulders;
    } else if (repoExercise.secondaryMuscleGroup?.toLowerCase() ==
        "legs - thighs") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.legsThighs;
    } else {
      throw Exception("Invalid secondary muscle group in repository exercise");
    }

    return blocExercise;
  }

  // _$ExerciseFromJson() is a function that will be in the .g file
  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  // _$ExerciseToJson() is a function that will be in the .g file
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
