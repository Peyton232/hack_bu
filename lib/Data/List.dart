import 'package:expense_manager/Classes/CashFlow.dart';
import '../CustomWidgets/ActivityCard.dart';
import 'package:flutter/material.dart';
import '../Data/constants.dart';

final List<CashFlow> listOfCashFlow = [
  CashFlow(
    date: 'January 31, 2021',
    amount: 256.56,
    name: "Salary",
    addSubtract: "+",
    color: kGreenColor,
  ),
];

// ActivityCard(
// name: 'Salary',
// addSubtract: '+',
// color: kGreenColor,
// amount: 256.56,
// date: "January 31, 2021",
// ),
