import 'package:covid19_stats/configs/constants.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import 'container_template.dart';

//  ChartData Class To show the Chart
class ChartData extends StatelessWidget {
  final Statewise stateData;
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  ChartData({Key key, this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: kDecoration.copyWith(
          color: Colors.grey.shade900, border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedCircularChart(
            key: _chartKey,
            holeLabel: '${stateData.state}',
            size: Size(200.0, 200.0),
            holeRadius: 70,
            initialChartData: getCircularChartData(stateData),
            chartType: CircularChartType.Pie,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
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
                  color: Colors.yellow.shade400.withOpacity(.5),
                  child: Text(
                    "Confirmed: ${stateData.confirmed}",
                    style:
                        TextStyle(color: Colors.yellow.shade200, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerTemplate(
                  color: Colors.orange.shade400.withOpacity(.5),
                  child: Text(
                    "Active: ${stateData.active}",
                    style:
                        TextStyle(color: Colors.orange.shade200, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCircularChartData(Statewise stateData) {
    var deaths = double.parse(stateData.deaths);
    var recovered = double.parse(stateData.recovered);
    var active = double.parse(stateData.active);
    var confirmed = double.parse(stateData.confirmed);
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(deaths, Colors.red),
          new CircularSegmentEntry(recovered, Colors.green.shade400,
              rankKey: 'Q2'),
          new CircularSegmentEntry(active, Colors.orange, rankKey: 'Q3'),
          new CircularSegmentEntry(confirmed, Colors.yellow, rankKey: 'Q4'),
        ],
        rankKey: '${stateData.state} Stats',
      ),
    ];
    return data;
  }
}
