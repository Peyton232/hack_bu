import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String month;
  String year;
  double monthlyIncome;
  double monthlyExpense;
  final charts.Color barColor;

  BarChartModel({
    this.month,
    this.year,
    this.monthlyIncome,
    this.monthlyExpense,
    this.barColor,
  });
}
