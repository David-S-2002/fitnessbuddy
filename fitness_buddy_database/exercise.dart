// format copied from
// https://github.com/ericgrandt/flutter-streams/blob/master/lib/models/note_model.dart

// If you annotate an object with @JSON Serializable, and you run build_runner, then
// a generated file (exercise.g.dart, in this case) will make the object
// JSON serializable so you don't have to do it manually.

// I tried to run build_runner but it didn't work; I'll come back to it later

import 'package:json_annotation/json_annotation.dart';
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

  // _$ExerciseFromJson() is a function that will be in the .g file
  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  // _$ExerciseToJson() is a function that will be in the .g file
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
