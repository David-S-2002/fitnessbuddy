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
    return Container(
        child: Column(
      children: [
        Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Circuit " +
                    circuitNumber.toString() +
                    ". Repeat " +
                    circuit.timesRepeated.toString() +
                    " times"),
                tileColor: Theme.of(context).primaryColor,
                trailing: const Icon(Icons.refresh),
              ),
            ),
            height: 100),
        for (int i = 0; i < circuit.numExercises; i++)
          Column(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                    title: Text(circuit.exercises[i].exerciseName +
                        " - " +
                        circuit.exercises[i].exerciseTime.toString() +
                        " seconds - " +
                        circuit.exercises[i].equipment)),
              ),
              height: 60,
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: Colors.black,
            )
          ]),
        Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                    title: Text(circuit.restTimeInCircuit.toString() +
                        " seconds rest within the circuit")))),
        const Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1,
          color: Colors.black,
        ),
        Container(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                    tileColor: Theme.of(context).primaryColor,
                    title: Text(circuit.restTimeAfterCircuit.toString() +
                        " seconds rest after the circuit is over"))))
      ],
    ));
  }
}
