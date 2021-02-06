import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../models/serializers.dart';
import 'categoryPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _tabs = ["Home", "Category", "Report"];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.category)),
              Tab(icon: Icon(Icons.report)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
                child: Text(
                  "Home",
                  style: Theme.of(context).textTheme.display1,
                )),
            CategoryPage(),
            Center(
                child: Text(
                  "Reports",
                  style: Theme.of(context).textTheme.display1,
                ))
          ],
        ));
  }
}