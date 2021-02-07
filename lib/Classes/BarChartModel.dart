import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class BarChartModel {
  String month;
  String year;
  double monthlyIncome;
  double monthlyExpense;
  Color color;

  BarChartModel({
    @required this.month,
    @required this.year,
    @required this.monthlyIncome,
    @required this.monthlyExpense,
    @required this.color,
  });
}
