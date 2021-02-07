import 'package:flutter/cupertino.dart';

class CashFlow {
  String name;
  double amount;
  String date;
  String addSubtract;
  Color color;
  //One for category
  //Screenshot for recipe (optional)

  //TODO: Conditional for color: green = income, red = expense

  CashFlow({
    @required this.date,
    @required this.amount,
    @required this.name,
    @required this.addSubtract,
    @required this.color,
  });
}
