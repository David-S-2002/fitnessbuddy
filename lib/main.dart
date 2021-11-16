import 'package:fitness_buddy_bloc/barrel.dart';
import 'package:fitness_buddy_bloc/fitness_buddy_bloc.dart';
import 'package:fitnessbuddy/home_page.dart';
import 'package:fitnessbuddy/workout_page.dart';
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
  // all navigation code is copied from:
  // https://bloclibrary.dev/#/flutterlogintutorial?id=login-page

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigatorState => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (BuildContext context, child) {
        return BlocListener<FitnessBuddyBloc, FitnessBuddyState>(
          listener: (BuildContext context, FitnessBuddyState state) {
            if (state.status == FitnessBuddyStatus.success) {
              _navigatorState.pushAndRemoveUntil<void>(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const WorkoutPage()),
                  (Route<dynamic> route) => false);
              // (
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => const WorkoutPage()));
            } else if (state.status == FitnessBuddyStatus.failure) {
              print("BLOC failure state");
            } else if (state.status == FitnessBuddyStatus.loading) {
              print("BLOC loading state");
            } else if (state.status == FitnessBuddyStatus.initial) {
              print("BLOC initial state");
            }
          },
          child: child,
        );
      },
      title: 'FitnessBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
