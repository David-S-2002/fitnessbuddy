// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      exerciseId: json['exerciseId'] as int,
      exerciseName: json['exerciseName'] as String,
      muscleGroup: json['muscleGroup'] as String,
      secondaryMuscleGroup: json['secondaryMuscleGroup'] as String?,
      equipment: json['equipment'] as String,
      difficulty: json['difficulty'] as int,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'exerciseName': instance.exerciseName,
      'muscleGroup': instance.muscleGroup,
      'secondaryMuscleGroup': instance.secondaryMuscleGroup,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
    };
