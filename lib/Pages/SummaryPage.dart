import '../Data/constants.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            appBarLabel: 'Summary',
          ),
        ],
      ),
    );
  }
}
