import 'package:flutter/material.dart';
import '../CustomWidgets/ActivityCard.dart';

class ActivityCard extends StatelessWidget {
  final String name;
  final double amount;
  final Color color;
  final String addSubtract;
  final String date;

  ActivityCard({
    @required this.amount,
    @required this.color,
    @required this.name,
    @required this.addSubtract,
    @required this.date,
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
          Column(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
