import 'package:covid19_stats/bloc/statesdata_bloc.dart';
import 'package:covid19_stats/repository/stateRepo.dart';
import 'package:covid19_stats/ui/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(),
        fontFamily: "Raleway",
        scaffoldBackgroundColor: Colors.grey.shade900,
        backgroundColor: Colors.grey.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => StatesdataBloc(repository: StateRepositoryImpl()),
        child: Home(),
      ),
    );
  }
}
