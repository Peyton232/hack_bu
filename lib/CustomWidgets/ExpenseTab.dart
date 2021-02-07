import 'package:flutter/material.dart';
import '../Data/constants.dart';

enum FlowMon {
  expense,
  Gain,
}

class ExpenseTab extends StatefulWidget {
  @override
  _ExpenseTabState createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  FlowMon selectedFlow = FlowMon.expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFlow = FlowMon.expense;
              });
            },
            child: Container(
              width: 120.0,
              height: 33.0,
              decoration: BoxDecoration(
                boxShadow: selectedFlow == FlowMon.expense ? kCardShadow : null,
                color:
                selectedFlow == FlowMon.expense ? kLightTealColor : kGrayColor,
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
                    color: selectedFlow == FlowMon.expense
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
                selectedFlow = FlowMon.Gain;
              });
            },
            child: Container(
              width: 120.0,
              height: 33.0,
              decoration: BoxDecoration(
                boxShadow: selectedFlow == FlowMon.Gain ? kCardShadow : null,
                color:
                selectedFlow == FlowMon.Gain ? kLightTealColor : kGrayColor,
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
                    color: selectedFlow == FlowMon.Gain
                        ? Colors.black
                        : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
