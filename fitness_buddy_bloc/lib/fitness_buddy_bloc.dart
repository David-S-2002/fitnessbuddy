import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barrel.dart';
import 'algorithm.dart';
part 'fitness_buddy_event.dart';
part 'fitness_buddy_state.dart';

class FitnessBuddyBloc extends Bloc<FitnessBuddyEvent, FitnessBuddyState> {
  FitnessBuddyBloc({required this.exerciseRepo})
      : super(const FitnessBuddyState()) {
    on<GenerateWorkout>(_onGenerateWorkout);
  }

  final ExerciseRepository exerciseRepo;

  Future<void> _onGenerateWorkout(
      GenerateWorkout event, Emitter<FitnessBuddyState> emit) async {
    // Emit a loading state while waiting for the algorithm
    emit(state.copyWith(status: FitnessBuddyStatus.loading));

    try {
      // if it works, then emit a success state
      emit(state.copyWith(
          circuits: await algorithm(event.workoutTime, event.muscleGroup,
              event.difficulty, exerciseRepo),
          status: FitnessBuddyStatus.success));
    } on Exception {
      // something went wrong; emit a failure state
      emit(state.copyWith(status: FitnessBuddyStatus.failure));
    }
  }
}
