import 'package:expense_manager/Classes/CashFlow.dart';
import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../Classes/BarChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeeklyChart extends StatefulWidget {
  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  List<charts.Series> seriesList;

  static List<charts.Series<BarChartModel, String>> _createCashFlowData() {
    final weeklyIncomeData = [
      BarChartModel(
        weeklyIncome: 86.64,
        day: 'Sun',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Mon',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Tue',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Wed',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Thurs',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Fri',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        weeklyIncome: 0.0,
        day: 'Sat',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
    ];

    final weeklyExpenseData = [
      BarChartModel(
        weeklyExpense: 0.0,
        day: 'Sun',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 0.0,
        day: 'Mon',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 27.68,
        day: 'Tue',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 86.21,
        day: 'Wed',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 64.94,
        day: 'Thurs',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 0.0,
        day: 'Fri',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        weeklyExpense: 0.0,
        day: 'Sat',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
    ];

    return [
      charts.Series<BarChartModel, String>(
        id: 'Income',
        domainFn: (BarChartModel cashFlow, _) => cashFlow.day,
        measureFn: (BarChartModel cashFlow, _) => cashFlow.weeklyIncome,
        data: weeklyIncomeData,
        colorFn: (BarChartModel cashFlow, _) => cashFlow.barColor,
      ),
      charts.Series<BarChartModel, String>(
        id: 'Expense',
        domainFn: (BarChartModel cashFlow, _) => cashFlow.day,
        measureFn: (BarChartModel cashFlow, _) => cashFlow.weeklyExpense,
        data: weeklyExpenseData,
        colorFn: (BarChartModel cashFlow, _) => cashFlow.barColor,
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createCashFlowData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kCardShadow,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 400,
      padding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Febuary 7 - Febuary 13",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: barChart(),
            )
          ],
        ),
      ),
    );
  }
}
