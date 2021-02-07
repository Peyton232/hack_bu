import 'package:flutter/material.dart';
import 'package:expense_manager/Data/constants.dart';

class HomeMoneyCard extends StatelessWidget {
  final String cardName;
  final double amount;
  final TextStyle style;
  final String addSubtract;

  HomeMoneyCard({
    @required this.cardName,
    @required this.amount,
    @required this.style,
    @required this.addSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: kGrayColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 35.0,
            decoration: BoxDecoration(
              color: kTealColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 8.0,
              ),
              child: Text(
                cardName,
                style: kHomeLabelTextStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            child: Center(
              child: Text(
                '$addSubtract \$$amount',
                style: style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
