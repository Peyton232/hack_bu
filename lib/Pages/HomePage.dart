import 'package:expense_manager/CustomWidgets/ActivityCard.dart';
import 'package:expense_manager/Data/List.dart';
import 'package:expense_manager/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/CustomWidgets/CustomAppBar.dart';
import 'package:expense_manager/CustomWidgets/HomeMoneyCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomAppBar(
              appBarLabel: 'Home',
            ),
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
            HomeMoneyCard(
              cardName: 'Money Spent:',
              amount: 123.45,
              style: kHomeMoneySpentTextStyle,
              addSubtract: '-',
            ),
            SizedBox(
              height: 20.0,
            ),
            HomeMoneyCard(
              cardName: 'Money Gained: ',
              amount: 256.64,
              style: kHomeMoneyGainedTextStyle,
              addSubtract: '+',
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
