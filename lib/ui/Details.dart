import 'package:covid19_stats/configs/constants.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/chartData.dart';
import 'widgets/sparkData.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final Statewise stateData;
  final int index;

  DetailsScreen({Key key, this.index, this.stateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateData.state),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            ChartData(
              stateData: stateData,
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.bottomRight,
              child: Text(
                "${stateData.lastupdatedtime}",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
            ),
            SparkData(
              stateData: stateData,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              decoration: kDecoration.copyWith(
                  color: Colors.grey.shade900,
                  border: Border.all(color: Colors.grey)),
              child: Text(
                "${stateData.statenotes.isEmpty ? 'No State Notes!' : stateData.statenotes}",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 18, fontFamily: 'Raleway', wordSpacing: 2),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
