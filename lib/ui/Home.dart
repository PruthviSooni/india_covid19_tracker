import 'package:covid19_stats/bloc/statesdata_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file:///C:/Projects/FlutterProjects/COVID-19_India_stats/covid19_stats/lib/ui/widgets/Details_Stats.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StatesdataBloc stateBloc;

  @override
  void initState() {
    super.initState();
    stateBloc = BlocProvider.of<StatesdataBloc>(context);
    stateBloc.add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cvoid-19'),
      ),
      body: Container(
        child: BlocBuilder<StatesdataBloc, StatesdataState>(
          // ignore: missing_return
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
              return Center(child: Text(state.msg));
            }
          },
        ),
      ),
    );
  }
}
