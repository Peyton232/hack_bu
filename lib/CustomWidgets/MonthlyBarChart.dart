import 'package:expense_manager/Classes/CashFlow.dart';
import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../Classes/BarChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthlyBarChart extends StatefulWidget {
  @override
  _MonthlyBarChartState createState() => _MonthlyBarChartState();
}

class _MonthlyBarChartState extends State<MonthlyBarChart> {
  List<charts.Series> seriesList;

  static List<charts.Series<BarChartModel, String>> _createCashFlowData() {
    final monthlyIncomeData = [
      BarChartModel(
        monthlyIncome: 465.34,
        month: 'Jan',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        monthlyIncome: 285.26,
        month: 'Feb',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      BarChartModel(
        monthlyIncome: 514.31,
        month: 'Mar',
        barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      ),
      // BarChartModel(
      //   monthlyIncome: 198.45,
      //   month: 'Apr',
      //   barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      // ),
      // BarChartModel(
      //   monthlyIncome: 376.54,
      //   month: 'May',
      //   barColor: charts.ColorUtil.fromDartColor(kGreenColor),
      // ),
    ];

    final monthlyExpenseData = [
      BarChartModel(
        monthlyExpense: 143.45,
        month: 'Jan',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        monthlyExpense: 89.76,
        month: 'Feb',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      BarChartModel(
        monthlyExpense: 313.45,
        month: 'Mar',
        barColor: charts.ColorUtil.fromDartColor(kRedColor),
      ),
      // BarChartModel(
      //   monthlyExpense: 201.90,
      //   month: 'Apr',
      //   barColor: charts.ColorUtil.fromDartColor(kRedColor),
      // ),
      // BarChartModel(
      //   monthlyExpense: 365.67,
      //   month: 'May',
      //   barColor: charts.ColorUtil.fromDartColor(kRedColor),
      // ),
    ];

    return [
      charts.Series<BarChartModel, String>(
        id: 'Income',
        domainFn: (BarChartModel cashFlow, _) => cashFlow.month,
        measureFn: (BarChartModel cashFlow, _) => cashFlow.monthlyIncome,
        data: monthlyIncomeData,
        colorFn: (BarChartModel cashFlow, _) => cashFlow.barColor,
      ),
      charts.Series<BarChartModel, String>(
        id: 'Expense',
        domainFn: (BarChartModel cashFlow, _) => cashFlow.month,
        measureFn: (BarChartModel cashFlow, _) => cashFlow.monthlyExpense,
        data: monthlyExpenseData,
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
              "2021",
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
