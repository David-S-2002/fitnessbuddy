import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'barrel.dart';
import 'algorithm.dart';
part 'fitness_buddy_event.dart';
part 'fitness_buddy_state.dart';

class FitnessBuddyBloc extends Bloc<FitnessBuddyEvent, FitnessBuddyState> {
  FitnessBuddyBloc({
    required ExerciseRepository exerciseRepo,
  })  : //_db = DBProvider.db,
        _exerciseRepo = ExerciseRepository(database: DBProvider.db),
        super(const FitnessBuddyState()) {
    on<GenerateWorkout>(_onGenerateWorkout);
  }

  //final DBProvider _db;
  final ExerciseRepository _exerciseRepo;

  Future<void> _onGenerateWorkout(
      GenerateWorkout event, Emitter<FitnessBuddyState> emit) async {
    // Emit a loading state while waiting for the algorithm
    emit(state.copyWith(status: FitnessBuddyStatus.loading));

    try {
      // if it works, then emit a success state
      emit(state.copyWith(
          circuits: await algorithm(event.workoutTime, event.muscleGroup,
              event.difficulty, _exerciseRepo),
          status: FitnessBuddyStatus.success));
    } on Exception {
      // something went wrong; emit a failure state
      emit(state.copyWith(status: FitnessBuddyStatus.failure));
    }
  }
}
