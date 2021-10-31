part of 'fitness_buddy_bloc.dart';

enum FitnessBuddyStatus { initial, loading, success, failure }

class FitnessBuddyState extends Equatable {
  // When initializing, set the state to "initial" and the circuits to
  // an empty list. This is before we generate the workout.
  const FitnessBuddyState(
      {this.status = FitnessBuddyStatus.initial, this.circuits = const []});

  final FitnessBuddyStatus status;
  final List<Circuit> circuits;

  // copyWith returns a copy of the original state, but pne
  // or more of the fields may be changed.
  // If one of the parameters is non-null, return the
  // state with that parameter changed.

  FitnessBuddyState copyWith(
      {FitnessBuddyStatus? status, List<Circuit>? circuits}) {
    return FitnessBuddyState(
        status: status ?? this.status, circuits: circuits ?? this.circuits);
  }

  @override
  List<Object> get props => [status, circuits];
}
