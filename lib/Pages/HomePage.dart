import 'package:flutter/material.dart';

import 'package:expense_manager/CustomWidgets/CustomAppBar.dart';
import 'package:expense_manager/CustomWidgets/HomeMoneyCard.dart';

import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../models/serializers.dart';
import 'categoryPage.dart';
import 'package:expense_manager/Data/constants.dart';


  class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CustomAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Container(
                      height: 100.0,
                      //color: kGrayColor, //debugging purposes
                      child: Center(
                        child: Text(
                          '\$4,567.89',
                          style: kHomeMoneyTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: HomeMoneyCard(
                      cardName: 'Money Spent:',
                      amount: 123.45,
                      style: kHomeMoneySpentTextStyle,
                      addSubtract: '-',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: HomeMoneyCard(
                      cardName: 'Money Gained: ',
                      amount: 256.64,
                      style: kHomeMoneyGainedTextStyle,
                      addSubtract: '+',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Recent Activity:',
                      style: kHomeLabelTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 5.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: <Widget>[
                          Activity(
                            name: 'Salary',
                            addSubtract: '+',
                            color: kGreenColor,
                            amount: 256.56,
                          ),
                          Text("Activity stuff"),
                          Text("Activity stuff"),
                          Text("Activity stuff"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),
      );
    }
  }


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


