import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitnessbuddy/widgets/circuit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutView extends StatefulWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    // This shows different widgets depending on the BLoC state
    return BlocBuilder<FitnessBuddyBloc, FitnessBuddyState>(
        builder: (BuildContext context, FitnessBuddyState state) {
      if (state.status == FitnessBuddyStatus.success) {
        return ListView(children: [
          for (int i = 0; i < state.circuits.length; i++)
            CircuitWidget(circuit: state.circuits[i], circuitNumber: i + 1)
        ]);
      } else if (state.status == FitnessBuddyStatus.loading) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            Text("Generating your workout...")
          ],
        ));
      } else if (state.status == FitnessBuddyStatus.failure) {
        return const Center(
            child: Text(
          "Sorry, we couldn't generate your workout. Please try choosing another workout",
          textAlign: TextAlign.center,
        ));
      } else {
        throw Exception("Invalid BLOC state");
      }
    });
  }
}
