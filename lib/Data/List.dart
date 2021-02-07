import 'package:expense_manager/Classes/CashFlow.dart';
import '../CustomWidgets/ActivityCard.dart';
import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../Classes/BarChartModel.dart';

final List<CashFlow> listOfCashFlow = [
  CashFlow(
    date: 'January 31, 2021',
    amount: 256.56,
    name: "Salary",
    addSubtract: "+",
    color: kGreenColor,
  ),
];

final List<BarChartModel> data = [
  BarChartModel(
    month: 'Jan',
    year: '2021',
    monthlyIncome: null,
    monthlyExpense: null,
    color: null,
  )
];
