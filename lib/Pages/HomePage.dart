import 'package:expense_manager/Data/constants.dart';
import 'package:flutter/material.dart';

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 20,
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 120.0,
        color: kGrayColor, //debugging purposes
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 40.0,
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('Settings');
                },
                child: Icon(Icons.dehaze),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'Home',
                    style: kAppBarTitleTextStyle,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Add expense/income');
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
