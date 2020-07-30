import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final List stateData;
  final int index;

  const DetailsScreen({Key key, this.index, this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateData[index].state),
      ),
      body: Container(
        child: Text(
          stateData[index].statecode,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
