import 'package:covid19_stats/configs/constatns.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:covid19_stats/ui/widgets/container_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final Statewise stateData;
  final int index;

  DetailsScreen({Key key, this.index, this.stateData}) : super(key: key);
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  getCircularChartData(Statewise stateData) {
    var deaths = double.parse(stateData.deaths);
    var recovered = double.parse(stateData.recovered);
    var active = double.parse(stateData.active);
    var confirmed = double.parse(stateData.confirmed);
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(deaths, Colors.red, rankKey: 'Q1'),
          new CircularSegmentEntry(recovered, Colors.green.shade400,
              rankKey: 'Q2'),
          new CircularSegmentEntry(active, Colors.orangeAccent, rankKey: 'Q3'),
          new CircularSegmentEntry(confirmed, Colors.yellow, rankKey: 'Q4'),
        ],
        rankKey: '${stateData.state} Stats',
      ),
    ];
    return data;
  }

  getSpikeData() {
    var deaths = double.parse(stateData.deaths);
    var deltaDeaths = double.parse(stateData.deltadeaths);
    var deltaRecovered = double.parse(stateData.deltarecovered);
    var data = [
      deaths - 200,
      deltaDeaths + 300,
      deltaRecovered + 300,
      deltaDeaths + 200
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateData.state),
      ),
      body: Container(
          child: Column(
        children: [
          chartData(context),
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
          sparkLineData(context),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "${stateData.statenotes}",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 20,
                    fontFamily: 'Raleway',
                  ),
            ),
          ),
        ],
      )),
    );
  }

//  Sparkline data to show the deaths in the specific state
  Container sparkLineData(BuildContext context) {
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
              "Deaths Stat's",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, fontFamily: 'Raleway'),
            ),
          ),
          Container(
            child: Sparkline(
              data: getSpikeData(),
              fillMode: FillMode.below,
              fillColor: Colors.red,
              sharpCorners: false,
              lineWidth: 5,
              pointColor: Colors.orangeAccent,
              pointsMode: PointsMode.all,
            ),
          ),
        ],
      ),
    );
  }

//  ChartData Function To show the Chart
  Container chartData(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: kDecoration.copyWith(
          color: Colors.grey.shade900, border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerTemplate(
                  color: Colors.red.shade500.withOpacity(.5),
                  child: Text(
                    "Deaths: ${stateData.deaths}",
                    style: TextStyle(color: Colors.red.shade200, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerTemplate(
                  color: Colors.green.shade400.withOpacity(.5),
                  child: Text(
                    "Recovered: ${stateData.recovered}",
                    style:
                        TextStyle(color: Colors.green.shade200, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerTemplate(
                  color: Colors.orange.shade400.withOpacity(.5),
                  child: Text(
                    "Confirmed: ${stateData.confirmed}",
                    style:
                        TextStyle(color: Colors.orange.shade200, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerTemplate(
                  color: Colors.lightGreenAccent.shade400.withOpacity(.5),
                  child: Text(
                    "Active: ${stateData.active}",
                    style: TextStyle(
                        color: Colors.lightGreenAccent.shade200, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          AnimatedCircularChart(
            key: _chartKey,
            holeLabel: '${stateData.state}',
            size: Size(200.0, 200.0),
            holeRadius: 70,
            initialChartData: getCircularChartData(stateData),
            chartType: CircularChartType.Pie,
          ),
        ],
      ),
    );
  }
}
