import 'package:fitnessbuddy/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_buddy_bloc/fitness_buddy_bloc.dart';
import 'package:fitness_buddy_repository/fitness_buddy_repository.dart';
import 'package:fitness_buddy_database/fitness_buddy_database.dart';

void main() {
  DBProvider database = DBProvider.db;
  ExerciseRepository exerciseRepository =
      ExerciseRepository(database: database);

  runApp(const FitnessBuddy(exerciseRepository: exerciseRepository));
}

class FitnessBuddy extends StatelessWidget {
  const FitnessBuddy({Key? key, required this.exerciseRepository})
      : super(key: key);

  final ExerciseRepository exerciseRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FitnessBuddyBloc>(
        create: (BuildContext context) =>
            FitnessBuddyBloc(exerciseRepo: exerciseRepository),
        child: MaterialApp(
          title: 'FitnessBuddy',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainPage(),
        ));
  }
}
