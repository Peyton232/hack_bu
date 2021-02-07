import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String month;
  String day;
  double weeklyIncome;
  double weeklyExpense;

  double monthlyIncome;
  double monthlyExpense;
  final charts.Color barColor;

  BarChartModel({
    this.month,
    this.monthlyIncome,
    this.monthlyExpense,
    this.barColor,
    this.day,
    this.weeklyExpense,
    this.weeklyIncome,
  });
}
