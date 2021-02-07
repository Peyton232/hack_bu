import 'package:flutter/material.dart';

/*
    Have constants for colors, text style, and so on that can be used throughout the whole program.
    This would make it easier to make any changes because you won't have to look for it within
    a hundred lines of code
 */

//UI Colors
const kTealColor = Color(0xff63b7b7);
const kGrayColor = Color(0xffefefef);
const kLightTealColor = Color(0xff93dcdc);
const kDarkTealColor = Color(0xff4c8989);
//Other colors: Black, White

//Amount/Monetary Colors
const kRedColor = Color(0xfff4141e);
const kGreenColor = Color(0xff00c000);

//Category Colors
const kRedPastelColor = Color(0xffff6663);
const kGreenPastelColor = Color(0xff9ee09e);
const kBluePastelColor = Color(0xff82b9cf);
const kYellowPastelColor = Color(0xfffdfd97);
const kPurplePastelColor = Color(0xffcc99c9);
const kOrangePastelColor = Color(0xfffeb144);

//For HomePage
const kCardShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(3.0, 3.0),
    blurRadius: 3.0,
  ),
];

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.white,
);

const kHomeMoneyTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
);

const kHomeLabelTextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400);

const kHomeMoneySpentTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: kRedColor,
);

const kHomeMoneyGainedTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: kGreenColor,
);
