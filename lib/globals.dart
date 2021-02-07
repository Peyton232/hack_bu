library my_prj.globals;
import 'Classes/CashFlow.dart';
import 'Classes/CatClass.dart';
import 'insults/insults.dart';
import 'Classes/Activity.dart';
import 'package:flutter/material.dart';


CashFlow totalCash = new CashFlow(
  date: "2/7/2021",
  amount: 712.31,
  name: "money",
  addSubtract: "+-",
  color: Colors.green,
  expense: 230.89,
  income: 943.20,
);

CatClass catPie = new CatClass();

Insults insultobj = new Insults();

Activity handler = new Activity();
int aCounter = 0;