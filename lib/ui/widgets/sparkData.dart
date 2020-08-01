import 'package:covid19_stats/configs/constants.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

//  SparkLine data to show the deaths in the specific state
class SparkData extends StatelessWidget {
  final Statewise stateData;

  const SparkData({Key key, this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: kDecoration.copyWith(
        color: Colors.grey.shade900,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "${stateData.state} Stat's by Days",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Sparkline(
                data: getSpikeData(),
                pointsMode: PointsMode.all,
                lineColor: Colors.red,
                pointSize: 8.0,
                sharpCorners: true,
                pointColor: Colors.yellow),
          ),
        ],
      ),
    );
  }

  getSpikeData() {
    var deaths = double.parse(stateData.deaths);
    var recovered = double.parse(stateData.recovered);
    var active = double.parse(stateData.active);
    var confirmed = double.parse(stateData.confirmed);
    var data = [deaths, recovered, active, confirmed];
    return data;
  }
}
