import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../CustomWidgets/ActivityCard.dart';

class MonthlyActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: kCardShadow,
      ),
      child: Column(
        children: <Widget>[
          ActivityCard(
            name: 'Salary',
            addSubtract: '+',
            color: kGreenColor,
            amount: 256.56,
            date: 'January 31, 2021',
          ),
          Divider(
            color: Colors.black54,
            height: 3.0,
            thickness: 0.5,
          ),
          ActivityCard(
            name: 'Phone Case',
            addSubtract: '-',
            color: kRedColor,
            amount: 21.64,
            date: 'January 25, 2021',
          ),
          Divider(
            color: Colors.black54,
            height: 3.0,
            thickness: 0.5,
          ),
          ActivityCard(
            name: 'Snack',
            addSubtract: '-',
            color: kRedColor,
            amount: 5.21,
            date: 'January 21, 2021',
          ),
          Divider(
            color: Colors.black54,
            height: 3.0,
            thickness: 0.5,
          ),
          ActivityCard(
            name: 'Gas',
            addSubtract: '-',
            color: kRedColor,
            amount: 25.21,
            date: 'January 21, 2021',
          ),
          Divider(
            color: Colors.black54,
            height: 3.0,
            thickness: 0.5,
          ),
          ActivityCard(
            name: 'Stimulus Check',
            addSubtract: '+',
            color: kGreenColor,
            amount: 600.00,
            date: 'January 4, 2021',
          ),
        ],
      ),
    );
  }
}
