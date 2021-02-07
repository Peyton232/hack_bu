import '../Data/constants.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';

enum Time {
  weekly,
  monthly,
}

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
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = Time.weekly;
                    });
                  },
                  child: Container(
                    width: 120.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                      boxShadow:
                          selectedTime == Time.weekly ? kCardShadow : null,
                      color: selectedTime == Time.weekly
                          ? kLightTealColor
                          : kGrayColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Weekly',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: selectedTime == Time.weekly
                              ? Colors.black
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = Time.monthly;
                    });
                  },
                  child: Container(
                    width: 120.0,
                    height: 33.0,
                    decoration: BoxDecoration(
                      boxShadow:
                          selectedTime == Time.monthly ? kCardShadow : null,
                      color: selectedTime == Time.monthly
                          ? kLightTealColor
                          : kGrayColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: selectedTime == Time.monthly
                              ? Colors.black
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
