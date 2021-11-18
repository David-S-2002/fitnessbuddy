// format copied from
// https://github.com/ericgrandt/flutter-streams/blob/master/lib/models/note_model.dart

import 'package:json_annotation/json_annotation.dart';
part 'exercise.g.dart';

@JsonSerializable(includeIfNull: true)
class Exercise {
  int? exerciseId;

  String exerciseName;
  String muscleGroup;
  String? secondaryMuscleGroup;
  String equipment;
  int? difficulty;

  Exercise(
      {required this.exerciseId,
      required this.exerciseName,
      required this.muscleGroup,
      required this.secondaryMuscleGroup,
      required this.equipment,
      required this.difficulty});

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
