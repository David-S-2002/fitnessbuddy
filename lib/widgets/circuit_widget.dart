import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircuitWidget extends StatelessWidget {
  const CircuitWidget(
      {Key? key, required this.circuit, required this.circuitNumber})
      : super(key: key);

  final Circuit circuit;
  final int circuitNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: ListTile(
              title: Text("Circuit " +
                  circuitNumber.toString() +
                  ". Repeat " +
                  circuit.timesRepeated.toString() +
                  " times"),
              tileColor: Theme.of(context).primaryColor,
            ),
            height: 100),
        for (int i = 0; i < circuit.numExercises; i++)
          Container(
            child: ListTile(
                title: Text(circuit.exercises[i].exerciseName +
                    " " +
                    circuit.exercises[i].exerciseTime.toString() +
                    " " +
                    circuit.exercises[i].equipment)),
            height: 100,
          ),
        ListTile(
            title: Text(circuit.restTimeInCircuit.toString() +
                " seconds rest within the circuit")),
        ListTile(
            title: Text(circuit.restTimeAfterCircuit.toString() +
                " seconds rest after the circuit is over"))
      ],
    );
  }
}
