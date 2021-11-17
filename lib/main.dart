import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitness_buddy_bloc/fitness_buddy_bloc.dart';
import 'package:fitnessbuddy/home_page.dart';
import 'package:fitnessbuddy/workout_page/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_buddy_repository/fitness_buddy_repository.dart';
import 'package:fitness_buddy_database/fitness_buddy_database.dart';

void main() async {
  final DBProvider database = await DBProvider.db;
  final ExerciseRepository exerciseRepository =
      ExerciseRepository(database: database);
  runApp(FitnessBuddyApp(
      exerciseRepository: exerciseRepository, database: database));
}

class FitnessBuddyApp extends StatelessWidget {
  const FitnessBuddyApp(
      {Key? key, required this.exerciseRepository, required this.database})
      : super(key: key);

  final ExerciseRepository exerciseRepository;
  final DBProvider database;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: exerciseRepository,
        child: BlocProvider(
            create: (BuildContext context) =>
                FitnessBuddyBloc(exerciseRepo: exerciseRepository),
            child: const FitnessBuddyAppView()));
  }
}

class FitnessBuddyAppView extends StatefulWidget {
  const FitnessBuddyAppView({Key? key}) : super(key: key);

  @override
  _FitnessBuddyAppViewState createState() => _FitnessBuddyAppViewState();
}

class _FitnessBuddyAppViewState extends State<FitnessBuddyAppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitnessBuddy',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen, backgroundColor: Colors.black),
      home: const MainPage(),
    );
  }
}
