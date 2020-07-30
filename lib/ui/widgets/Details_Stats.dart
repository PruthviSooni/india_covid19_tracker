import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class StatesPage extends StatelessWidget {
  final List<Statewise> stateModel;

  const StatesPage({Key key, this.stateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: stateModel.length,
        itemBuilder: (context, index) {
          return Container(
            child: Text(
              stateModel[index].state,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        });
  }
}
