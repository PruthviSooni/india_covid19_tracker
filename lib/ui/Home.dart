import 'package:covid19_stats/bloc/statesdata_bloc.dart';
import 'package:covid19_stats/ui/widgets/Home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StatesdataBloc stateBloc;

  @override
  void initState() {
    super.initState();
//    added event to the bloc in init state
    stateBloc = BlocProvider.of<StatesdataBloc>(context);
    stateBloc.add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('India States COVID-19 Stats'),
      ),
//      assign a builder to check the state of the bloc using BlocBuilder
      body: BlocBuilder<StatesdataBloc, StatesdataState>(
          builder: (context, state) {
        if (state is StatesdataLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StatesdataLoaded) {
          return StatesPage(
            stateModel: state.list,
          );
        } else if (state is StatesdataError) {
          print(state.msg.toString());
          return Text(state.msg);
        }
        return Container();
      }),
    );
  }
}
