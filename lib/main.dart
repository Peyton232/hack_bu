import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'db/migrations/db_script.dart';
import 'db/migrations/offline_db_provider.dart';
import 'db/migrations/init_db.dart';
import 'package:expense_manager/pages/homePage.dart';


void main() {

  OfflineDbProvider.provider.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
