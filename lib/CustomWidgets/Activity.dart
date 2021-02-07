import 'package:flutter/material.dart';
import '../CustomWidgets/Activity.dart';

class Activity extends StatelessWidget {
  final String name;
  final double amount;
  final Color color;
  final String addSubtract;

  Activity({
    @required this.amount,
    @required this.color,
    @required this.name,
    @required this.addSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '$addSubtract \$$amount',
              style: TextStyle(
                color: color,
                fontSize: 20.0,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
