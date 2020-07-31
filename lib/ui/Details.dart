import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Statewise stateData;
  final int index;

  const DetailsScreen({Key key, this.index, this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateData.state),
      ),
      body: Container(
        child: Text(
          stateData.statecode,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
