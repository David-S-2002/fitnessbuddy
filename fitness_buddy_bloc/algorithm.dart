// When the GenerateWorkout event gets sent to the BLOC,
// the BLOC will call the algorithm, which will return a workout
// (list of Circuits) based on these parameters. The BLOC will pass
// the parameters to the algorithm.

import 'barrel.dart';
import 'models.dart';

List<Circuit> algorithm(
    DateTime workoutTime, MuscleGroup muscleGroup, Difficulty difficulty) {
  List<Circuit> circuits = [];

  // Calculate how many circuits, how long each circuit is (totalCircuitTime), and
  // how much rest time there will be in between

  // Simple formula we could use for now: numCircuits = workoutTime / 5

  // Determine how many times each circuit will be repeated
  // Determine how to split up a single iteration of a circuit into exercises

  // Using the repository, get all the exercises that fit the muscle group
  // and the difficulty we want

  // Fill the time intervals we have determined with the exercises, randomly chosen

  // Once an exercise has been chosen, remove it from the list of possible exercises

  return circuits;
}
