import 'package:expense_manager/Classes/BarChartModel.dart';
import 'package:expense_manager/CustomWidgets/WeeklyChart.dart';
import '../Data/constants.dart';
import '../CustomWidgets/TimeTab.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../Data/List.dart';
import '../CustomWidgets/MonthlyBarChart.dart';
import '../CustomWidgets/ActivityCard.dart';

enum Time {
  weekly,
  monthly,
}

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
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = Time.weekly;
                      });
                    },
                    child: Container(
                      width: 120.0,
                      height: 33.0,
                      decoration: BoxDecoration(
                        boxShadow:
                            selectedTime == Time.weekly ? kCardShadow : null,
                        color: selectedTime == Time.weekly
                            ? kLightTealColor
                            : kGrayColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Weekly',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: selectedTime == Time.weekly
                                ? Colors.black
                                : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = Time.monthly;
                      });
                    },
                    child: Container(
                      width: 120.0,
                      height: 33.0,
                      decoration: BoxDecoration(
                        boxShadow:
                            selectedTime == Time.monthly ? kCardShadow : null,
                        color: selectedTime == Time.monthly
                            ? kLightTealColor
                            : kGrayColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Monthly',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: selectedTime == Time.monthly
                                ? Colors.black
                                : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: selectedTime == Time.monthly
                  ? MonthlyBarChart()
                  : WeeklyChart(),
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
