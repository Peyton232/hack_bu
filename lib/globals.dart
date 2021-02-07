library my_prj.globals;
import 'Classes/CashFlow.dart';
import 'Classes/CatClass.dart';
import 'insults/insults.dart';
import 'package:flutter/material.dart';


CashFlow totalCash = new CashFlow(
  date: "2/7/2021",
  amount: 0,
  name: "money",
  addSubtract: "+-",
  color: Colors.green,
  expense: 0,
  income: 0,
);

CatClass catPie = new CatClass();

Insults insultobj = new Insults();