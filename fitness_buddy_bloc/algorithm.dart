// When the GenerateWorkout event gets sent to the BLOC,
// the BLOC will call the algorithm, which will return a workout
// (list of Circuits) based on these parameters. The BLOC will pass
// the parameters to the algorithm.

import 'barrel.dart';
import 'models.dart';

List<Circuit> algorithm(
    DateTime workoutTime, MuscleGroup muscleGroup, Difficulty difficulty) {
  List<Circuit> circuits = [];

  // logic goes here

  return circuits;
}
