import 'package:covid19_stats/models/statesModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class StatesPage extends StatelessWidget {
  final List<Statewise> stateModel;

  const StatesPage({Key key, this.stateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText1;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "India States COVID-19 Stats",
            style: textStyle.copyWith(fontSize: 30),
          ),
          ListView.builder(
              controller: scrollOffset(10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: stateModel.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).backgroundColor,
                  shadowColor: Colors.grey.shade800,
                  elevation: 2,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade500, width: .9)),
                  borderOnForeground: true,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    hoverColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stateModel[index].state,
                            style: textStyle.copyWith(fontSize: 20),
                          ),
                          Text(
                            "Confirmed: ${stateModel[index].confirmed}",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 18),
                          ),
                          Text(
                            'Deaths: ${stateModel[index].deaths}',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                          Text(
                            'Recovered: ${stateModel[index].recovered}',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  scrollOffset(double offset) {
    ScrollController scrollController = ScrollController(
      initialScrollOffset: offset, // or whatever offset you wish
      keepScrollOffset: true,
    );
  }
}
