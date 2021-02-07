import 'package:expense_manager/Classes/BarChartModel.dart';
import '../Data/constants.dart';
import '../CustomWidgets/TimeTab.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../Data/List.dart';
import '../CustomWidgets/MonthlyBarChart.dart';
import '../CustomWidgets/ActivityCard.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Time selectedTime = Time.weekly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            TimeTab(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MonthlyBarChart(),
            ),
            Text(
              'Activity',
              style: kHomeLabelTextStyle,
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

//base the content on the enums
//have two separate widget classes for weekly and monthly
