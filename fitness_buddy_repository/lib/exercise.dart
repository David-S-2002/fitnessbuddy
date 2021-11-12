// any/all models that the repository uses go here

// format copied from
// https://github.com/ericgrandt/flutter-streams/blob/master/lib/models/note_model.dart

import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitness_buddy_database/exercise.dart';

part 'exercise.g.dart';

@JsonSerializable()
class RepoExercise {
  String exerciseName;
  int exerciseId;
  String muscleGroup;
  String? secondaryMuscleGroup;
  String equipment;
  int difficulty;

  RepoExercise(
      {required this.exerciseName,
      required this.exerciseId,
      required this.muscleGroup,
      required this.secondaryMuscleGroup,
      required this.equipment,
      required this.difficulty});

  RepoExercise convertDbExerciseToRepoExercise(Exercise dbExercise) {
    return RepoExercise.fromJson(dbExercise.toJson());
  }

  // I didn't use fromJson and toJson for this because the fields in the
  // models were different.

  BLOCExercise convertRepoExerciseToBlocExercise() {
    BLOCExercise blocExercise = BLOCExercise(
        exerciseName: exerciseName,
        exerciseTime: -1,
        equipment: equipment,
        primaryMuscleGroup: MuscleGroup.uninitialized,
        secondaryMuscleGroup: MuscleGroup.uninitialized,
        difficulty: Difficulty.uninitialized);

    if (difficulty == 1) {
      blocExercise.difficulty = Difficulty.easy;
    } else if (difficulty == 2) {
      blocExercise.difficulty = Difficulty.medium;
    } else if (difficulty == 3) {
      blocExercise.difficulty = Difficulty.hard;
    }

    if (muscleGroup.toLowerCase() == "abs") {
      blocExercise.primaryMuscleGroup = MuscleGroup.abs;
    } else if (muscleGroup.toLowerCase() == "arms") {
      blocExercise.primaryMuscleGroup = MuscleGroup.arms;
    } else if (muscleGroup.toLowerCase() == "back") {
      blocExercise.primaryMuscleGroup = MuscleGroup.back;
    } else if (muscleGroup.toLowerCase() == "butt/hips") {
      blocExercise.primaryMuscleGroup = MuscleGroup.buttAndHips;
    } else if (muscleGroup.toLowerCase() == "chest") {
      blocExercise.primaryMuscleGroup = MuscleGroup.chest;
    } else if (muscleGroup.toLowerCase() == "full body/integrated") {
      blocExercise.primaryMuscleGroup = MuscleGroup.fullBodyOrIntegrated;
    } else if (muscleGroup.toLowerCase() == "legs - calves and shins") {
      blocExercise.primaryMuscleGroup = MuscleGroup.legsCalvesAndShins;
    } else if (muscleGroup.toLowerCase() == "shoulders") {
      blocExercise.primaryMuscleGroup = MuscleGroup.shoulders;
    } else if (muscleGroup.toLowerCase() == "legs - thighs") {
      blocExercise.primaryMuscleGroup = MuscleGroup.legsThighs;
    } else {
      throw Exception("Invalid primary muscle group in repository exercise");
    }

    if (secondaryMuscleGroup?.toLowerCase() == "abs") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.abs;
    } else if (secondaryMuscleGroup?.toLowerCase() == "arms") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.arms;
    } else if (secondaryMuscleGroup?.toLowerCase() == "back") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.back;
    } else if (secondaryMuscleGroup?.toLowerCase() == "butt/hips") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.buttAndHips;
    } else if (secondaryMuscleGroup?.toLowerCase() == "chest") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.chest;
    } else if (secondaryMuscleGroup?.toLowerCase() == "full body/integrated") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.fullBodyOrIntegrated;
    } else if (secondaryMuscleGroup?.toLowerCase() ==
        "legs - calves and shins") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.legsCalvesAndShins;
    } else if (secondaryMuscleGroup?.toLowerCase() == "shoulders") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.shoulders;
    } else if (secondaryMuscleGroup?.toLowerCase() == "legs - thighs") {
      blocExercise.secondaryMuscleGroup = MuscleGroup.legsThighs;
    } else {
      throw Exception("Invalid secondary muscle group in repository exercise");
    }

    return blocExercise;
  }

  // _$ExerciseFromJson() is a function that will be in the .g file
  factory RepoExercise.fromJson(Map<String, dynamic> json) =>
      _$RepoExerciseFromJson(json);

  // _$ExerciseToJson() is a function that will be in the .g file
  Map<String, dynamic> toJson() => _$RepoExerciseToJson(this);
}
