import 'package:flutter/material.dart';

import 'package:expense_manager/CustomWidgets/CustomAppBar.dart';
import 'package:expense_manager/CustomWidgets/HomeMoneyCard.dart';
import '../CustomWidgets/Activity.dart';

import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../models/serializers.dart';
import 'categoryPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _tabs = ["Home", "Category", "Report"];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }


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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: kCardShadow,
                ),
                child: Column(
                  children: <Widget>[
                    Activity(
                      name: 'Salary',
                      addSubtract: '+',
                      color: kGreenColor,
                      amount: 256.56,
                    ),
                    Divider(
                      color: Colors.black54,
                      height: 3.0,
                      thickness: 0.5,
                    ),
                    Activity(
                      name: 'Phone Case',
                      addSubtract: '-',
                      color: kRedColor,
                      amount: 21.64,
                    ),
                    Divider(
                      color: Colors.black54,
                      height: 3.0,
                      thickness: 0.5,
                    ),
                    Activity(
                      name: 'Snack',
                      addSubtract: '-',
                      color: kRedColor,
                      amount: 5.21,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
                child: Text(
                  "Home",
                  style: Theme.of(context).textTheme.display1,
                )),
            CategoryPage(),
            Center(
                child: Text(
                  "Reports",
                  style: Theme.of(context).textTheme.display1,
                ))
          ],
        ))
  }

}

