import '../Data/constants.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(
            appBarLabel: 'Categories',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: kBluePastelColor,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: kCardShadow,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Utilities',
                      style: TextStyle(fontSize: 20.0),
                    )),
                    Icon(Icons.build),
                  ],
                ),
              ),
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
