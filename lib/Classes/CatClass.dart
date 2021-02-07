import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CatClass {
  List<String> cats;
  List<double> catsCost;

  void addCat(String cat, double cost){
    cats.add(cat);
    catsCost.add(cost);
  }
}
