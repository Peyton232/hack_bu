import 'package:expense_manager/CustomWidgets/ActivityCard.dart';
import 'package:expense_manager/Data/List.dart';
import 'package:expense_manager/Data/constants.dart';
import 'package:flutter/material.dart';

import 'package:expense_manager/CustomWidgets/CustomAppBar.dart';
import 'package:expense_manager/CustomWidgets/HomeMoneyCard.dart';

import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../models/serializers.dart';
import 'category_Page.dart';
import 'package:expense_manager/Data/constants.dart';
//import 'package:expense_manager/routes/add_expense.dart';
import 'package:flutter/cupertino.dart';
import '../routes/add_expense.dart';
import '../Classes/CashFlow.dart';

import '../globals.dart' as globals;


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // CustomAppBar(
            //   appBarLabel: 'Home',
            // ),
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
                    //'\$4,567.89',
                    "\$" + globals.totalCash.amount.toString(),
                    style: kHomeMoneyTextStyle,
                  ),
                ),
              ),
            ),
            HomeMoneyCard(
              cardName: 'Money Spent:',
              amount: globals.totalCash.expense.toString(),
              style: kHomeMoneySpentTextStyle,
              addSubtract: '-',
            ),
            SizedBox(
              height: 20.0,
            ),
            HomeMoneyCard(
              cardName: 'Money Gained: ',
              amount: globals.totalCash.income.toString(),
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

Widget _getExpenses() {
  var expense1 = ExpenseModel().rebuild((b) => b
    ..id = 1
    ..title = "Coffee"
    ..notes = "Coffee at peepalbot"
    ..amount = 129.00);

  var expense2 = ExpenseModel().rebuild((b) => b
    ..id = 2
    ..title = "Lunch"
    ..notes = "Momos at dilli bazar"
    ..amount = 150.00);

  var expense3 = ExpenseModel().rebuild((b) => b
    ..id = 3
    ..title = "Pants"
    ..notes = "Bought a pair of pants from Dbmg"
    ..amount = 2500.00);

  var ls = [expense1, expense2, expense3];

  return ListView.builder(
    itemCount: ls.length,
    itemBuilder: (context, index) {
      var expense = ls[index];
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: new Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.white)),
        margin: EdgeInsets.all(12.0),
        child: ListTile(
          onTap: () {},
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {},
          ),
          title: Text(
            expense.title + " - Rs." + expense.amount.toString(),
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: Theme.of(context).accentColor),
          ),
          subtitle: Text(
            expense.notes,
          ),
        ),
      );
    },
  );
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
