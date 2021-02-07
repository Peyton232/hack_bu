import 'package:expense_manager/Classes/CashFlow.dart';
import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../Classes/BarChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

final List<CashFlow> listOfCashFlow = [
  CashFlow(
    date: 'January 31, 2021',
    amount: 256.56,
    name: "Salary",
    addSubtract: "+",
    color: kGreenColor,
  ),
];
