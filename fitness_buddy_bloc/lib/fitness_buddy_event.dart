// SOURCE: Used the structure from https://bloclibrary.dev/#/flutterlogintutorial?id=login-bloc

part of 'fitness_buddy_bloc.dart';

abstract class FitnessBuddyEvent extends Equatable {
  const FitnessBuddyEvent();

  @override
  List<Object> get props => [];
}

class GenerateWorkout extends FitnessBuddyEvent {
  const GenerateWorkout(
      {required this.workoutTime,
      required this.muscleGroup,
      required this.difficulty});

  final int workoutTime;
  final String muscleGroup;
  final int difficulty;

  @override
  List<Object> get props => [workoutTime, muscleGroup, difficulty];
}
