// format copied from
// https://github.com/ericgrandt/flutter-streams/blob/master/lib/models/note_model.dart

import 'package:json_annotation/json_annotation.dart';
import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitness_buddy_database/exercise.dart';

part 'exercise.g.dart';

@JsonSerializable()
class RepoExercise {
  String exerciseName;
  int? exerciseId;
  String muscleGroup;
  String? secondaryMuscleGroup;
  String equipment;
  int? difficulty;

  RepoExercise(
      {required this.exerciseName,
      required this.exerciseId,
      required this.muscleGroup,
      required this.secondaryMuscleGroup,
      required this.equipment,
      required this.difficulty});

  @override
  String toString() =>
      "Exercise: Name: " +
      exerciseName +
      ". Equipment: " +
      equipment +
      ". Muscle group: " +
      muscleGroup.toString() +
      ". Secondary muscle group: " +
      secondaryMuscleGroup.toString() +
      ". Difficulty: " +
      difficulty.toString();

  RepoExercise convertDbExerciseToRepoExercise(Exercise dbExercise) {
    return RepoExercise.fromJson(dbExercise.toJson());
  }

  BLOCExercise convertRepoExerciseToBlocExercise() {
    return BLOCExercise(
        exerciseName: exerciseName,
        exerciseTime: -1,
        equipment: equipment,
        primaryMuscleGroup: muscleGroup,
        secondaryMuscleGroup: secondaryMuscleGroup,
        difficulty: difficulty);
  }

  factory RepoExercise.fromJson(Map<String, dynamic> json) =>
      _$RepoExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$RepoExerciseToJson(this);
}
