import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';

import 'states_stats.dart';

class StatesPage extends StatelessWidget {
  final List<Statewise> stateModel;

  const StatesPage({Key key, this.stateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText1;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: stateModel.length,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).backgroundColor,
          shadowColor: Colors.grey.shade500,
          elevation: 2,
          margin: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade500, width: .2)),
          borderOnForeground: true,
//          passing data and index of the specific location
//          where the user tap in listView and textStyle also
          child: StatesStats(
            stateModel: stateModel,
            textStyle: textStyle,
            index: index,
          ),
        );
      },
    );
  }
}
