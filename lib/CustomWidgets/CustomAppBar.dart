import 'package:flutter/material.dart';
import 'package:expense_manager/Data/constants.dart';
import '../Pages/categoryPage.dart';
import '../Pages/settingsPage.dart';
import '../routes/add_expense.dart';

class CustomAppBar extends StatefulWidget {
  final String appBarLabel;
  final Function plusFunction;

  CustomAppBar({@required this.appBarLabel, @required this.plusFunction});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      color: kDarkTealColor, //debugging purposes
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 40.0,
        ),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //return  settingsPage();
                }));
              },
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
                size: 25.0,
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  widget.appBarLabel,
                  style: kAppBarTitleTextStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddExpense()));
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
