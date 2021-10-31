// implement the bloc
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barrel.dart';
import 'algorithm.dart';
part 'fitness_buddy_event.dart';
part 'fitness_buddy_state.dart';

// Need to have the repository as a member of the
// FitnessBuddyBloc class.

class FitnessBuddyBloc extends Bloc<FitnessBuddyEvent, FitnessBuddyState> {
  FitnessBuddyBloc() : super(const FitnessBuddyState()) {
    on<GenerateWorkout>(_onGenerateWorkout);
  }

  Future<void> _onGenerateWorkout(
      GenerateWorkout event, Emitter<FitnessBuddyState> emit) async {
    // Emit a loading state while waiting for the repository
    emit(state.copyWith(status: FitnessBuddyStatus.loading));

    try {
      // call the repo with "await" to get the exercises

      // if it works, then emit a success state
      emit(state.copyWith(
          circuits:
              algorithm(event.workoutTime, event.muscleGroup, event.difficulty),
          status: FitnessBuddyStatus.success));
    } on Exception {
      // something went wrong; emit a failure state
      emit(state.copyWith(status: FitnessBuddyStatus.failure));
    }
  }
}
