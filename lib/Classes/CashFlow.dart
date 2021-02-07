import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CashFlow {
  String name;
  double amount;
  String date;
  String addSubtract;
  Color color;

  double income;
  double expense;
  //One for category
  //Screenshot for recipe (optional)

  //TODO: Conditional for color: green = income, red = expense

  CashFlow({
    @required this.date,
    @required this.amount,
    @required this.name,
    @required this.addSubtract,
    @required this.color,
    @required this.income,
    @required this.expense,
  });

  void addAmount(double num){
    amount += num;
    color = Colors.green;
  }

  void subAmount(double num){
    amount -= num;
    color = Colors.red;
  }
}
