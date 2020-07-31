import 'package:covid19_stats/models/statesModel.dart';
import 'package:covid19_stats/ui/widgets/container_template.dart';
import 'package:flutter/material.dart';

import '../Details.dart';

// Template class to show the list of states on the Home page
class StatesStats extends StatelessWidget {
  const StatesStats({
    Key key,
    @required this.stateModel,
    @required this.textStyle,
    @required this.index,
  }) : super(key: key);

  final List<Statewise> stateModel;
  final TextStyle textStyle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              stateData: stateModel[index],
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      hoverColor: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stateModel[index].state,
              style: textStyle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
              spacing: 2,
              runSpacing: 8,
              children: [
                ContainerTemplate(
                  color: Colors.orange.shade400.withOpacity(.2),
                  child: Text(
                    "Confirmed: ${stateModel[index].confirmed}",
                    style:
                        TextStyle(color: Colors.orange.shade200, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ContainerTemplate(
                  color: Colors.green.shade400.withOpacity(.2),
                  child: Text(
                    'Recovered: ${stateModel[index].recovered}',
                    style:
                        TextStyle(color: Colors.green.shade300, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ContainerTemplate(
                  color: Colors.red.shade500.withOpacity(.3),
                  child: Text(
                    'Recovered: ${stateModel[index].deaths}',
                    style: TextStyle(color: Colors.red.shade200, fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
