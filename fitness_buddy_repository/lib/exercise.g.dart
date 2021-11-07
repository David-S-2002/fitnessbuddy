// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      exerciseName: json['exerciseName'] as String,
      muscleGroup: json['muscleGroup'] as String,
      secondaryMuscleGroup: json['secondaryMuscleGroup'] as String?,
      equipment: json['equipment'] as String,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'muscleGroup': instance.muscleGroup,
      'secondaryMuscleGroup': instance.secondaryMuscleGroup,
      'equipment': instance.equipment,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
