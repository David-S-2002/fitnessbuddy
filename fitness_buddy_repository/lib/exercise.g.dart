// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoExercise _$RepoExerciseFromJson(Map<String, dynamic> json) => RepoExercise(
      exerciseName: json['exerciseName'] as String,
      exerciseId: json['exerciseId'] as int?,
      muscleGroup: json['muscleGroup'] as String,
      secondaryMuscleGroup: json['secondaryMuscleGroup'] as String?,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as int?,
    );

Map<String, dynamic> _$RepoExerciseToJson(RepoExercise instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'exerciseId': instance.exerciseId,
      'muscleGroup': instance.muscleGroup,
      'secondaryMuscleGroup': instance.secondaryMuscleGroup,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
    };
