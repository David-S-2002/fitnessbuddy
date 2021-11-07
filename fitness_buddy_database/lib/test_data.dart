import 'package:fitness_buddy_database/exercise.dart';

// Here are some exercises to test the database with
List<Exercise> testExercises = [
  Exercise(
      exerciseId: 1,
      exerciseName: "Bodyweight squat",
      muscleGroup: "abs",
      secondaryMuscleGroup: "glutes/hips",
      equipment: "none",
      difficulty: 1),
  Exercise(
      exerciseId: 2,
      exerciseName: "Crunch",
      muscleGroup: "abs",
      secondaryMuscleGroup: null,
      equipment: "none",
      difficulty: 1),
  Exercise(
      exerciseId: 3,
      exerciseName: "Seated chest press",
      muscleGroup: "chest",
      secondaryMuscleGroup: null,
      equipment: "weight machine/selectorized",
      difficulty: 1),
  Exercise(
      exerciseName: "Push-up",
      exerciseId: 4,
      muscleGroup: "arms",
      secondaryMuscleGroup: "chest",
      equipment: "none",
      difficulty: 2),
  Exercise(
      exerciseName: "Push-up with staggered hands",
      exerciseId: 5,
      muscleGroup: "arms",
      secondaryMuscleGroup: "chest",
      equipment: "none",
      difficulty: 3),
  Exercise(
      exerciseName: "Back squat",
      exerciseId: 6,
      muscleGroup: "Glutes/hips",
      secondaryMuscleGroup: "Legs - thighs",
      equipment: "Barbell",
      difficulty: 3)
];
