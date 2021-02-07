import 'package:expense_manager/insults/Insults.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_manager/Data/constants.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/categoryPage.dart';
import 'Pages/SummaryPage.dart';
import 'db/migrations/db_script.dart';
import 'db/offline_db_provider.dart';
import 'db/migrations/init_db.dart';
import 'CustomWidgets/CustomAppBar.dart';
import 'Classes/CashFlow.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  OfflineDbProvider.provider.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    SummaryPage(),
    HomePage(),
    CategoryPage(),
  ];

  List<String> appBarTitle = [
    'Summary',
    'Home',
    'Categories',
  ];

  List<Function> plusButton = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _insultAlert() {
    var insultobj = new Insults();
    return CupertinoAlertDialog(
      title: Text("Spent to Much"),
      content: Text(insultobj.getInsult),
      actions: [
        CupertinoDialogAction(
          child: Text("Close"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text("I Agree"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomAppBar(
            appBarLabel: appBarTitle.elementAt(_selectedIndex),
          ),
          Expanded(
            flex: 1,
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          BottomNavigationBar(
            backgroundColor: kDarkTealColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart),
                label: 'Summary',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Categories',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kLightTealColor,
            unselectedItemColor: Colors.black54,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}

// Scaffold(
// body: Center(
// child: _widgetOptions.elementAt(_selectedIndex),
// ),
// bottomNavigationBar: BottomNavigationBar(
// backgroundColor: kDarkTealColor,
// items: const <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: Icon(Icons.insert_chart),
// label: 'Summary',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.house),
// label: 'Home',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.dashboard),
// label: 'Categories',
// ),
// ],
// currentIndex: _selectedIndex,
// selectedItemColor: kLightTealColor,
// unselectedItemColor: Colors.black54,
// onTap: _onItemTapped,
// ),
// );
