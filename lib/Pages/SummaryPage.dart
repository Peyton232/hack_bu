import '../CustomWidgets/TimeTab.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';
import 'package:charts_flutter/flutter.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Time selectedTime = Time.weekly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            appBarLabel: 'Summary',
          ),
          TimeTab(),
        ],
      ),
    );
  }
}

//base the content on the enums
//have two separate widget classes for weekly and monthly
