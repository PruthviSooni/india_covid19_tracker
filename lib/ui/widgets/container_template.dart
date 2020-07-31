import 'package:flutter/material.dart';

class ContainerTemplate extends StatelessWidget {
  final Widget child;
  final Color color;

  const ContainerTemplate({Key key, this.color, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
