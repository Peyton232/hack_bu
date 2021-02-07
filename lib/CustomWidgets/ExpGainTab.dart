import 'package:flutter/material.dart';
import '../Data/constants.dart';
import '../globals.dart' as globals;

enum MoneyFlow {
  expense,
  gain,
}

class ExpGainTab extends StatefulWidget {
  @override
  _ExpGainTabState createState() => _ExpGainTabState();
}

class _ExpGainTabState extends State<ExpGainTab> {
  MoneyFlow selectedMoneyFlow = MoneyFlow.expense;

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
                selectedMoneyFlow = MoneyFlow.expense;
                globals.expense = true;
              });
            },
            child: Container(
              width: 120.0,
              height: 33.0,
              decoration: BoxDecoration(
                boxShadow:
                selectedMoneyFlow == MoneyFlow.expense ? kCardShadow : null,
                color: selectedMoneyFlow == MoneyFlow.expense
                    ? kLightTealColor
                    : kGrayColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'Expense',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: selectedMoneyFlow == MoneyFlow.expense
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
                selectedMoneyFlow = MoneyFlow.gain;
                globals.expense = false;
              });
            },
            child: Container(
              width: 120.0,
              height: 33.0,
              decoration: BoxDecoration(
                boxShadow:
                selectedMoneyFlow == MoneyFlow.gain ? kCardShadow : null,
                color: selectedMoneyFlow == MoneyFlow.gain
                    ? kLightTealColor
                    : kGrayColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'Gain',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: selectedMoneyFlow == MoneyFlow.gain
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