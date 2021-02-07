import 'dart:ui';

import 'package:expense_manager/Data/constants.dart';
import 'package:expense_manager/blocks/category_block.dart';
import 'package:expense_manager/models/category_model.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class AddCategory extends StatefulWidget {
  final CategoryBlock categoryBloc;

  AddCategory({this.categoryBloc});

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  void initState() {
    super.initState();
    widget.categoryBloc.updateCreateCategory(CategoryModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkTealColor,
        title: Text("Add New Category"),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: StreamBuilder(
            stream: widget.categoryBloc.createCategoryStream,
            builder: (ctxt, AsyncSnapshot<CategoryModel> catgorySnap) {
              if (!catgorySnap.hasData) return CircularProgressIndicator();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Category Name:',
                    style: kActivityLabelTextStyle,
                  ),
                  TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(hintText: "Enter Name"),
                      onChanged: (String text) {
                        if (text == null || text.trim() == "") return;
                        var category = catgorySnap.data;
                        var upated = category.rebuild((b) => b..title = text);
                        widget.categoryBloc.updateCreateCategory(upated);
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Necessary Purchase:',
                    style: kActivityLabelTextStyle,
                  ),
                  Container(
                    child: new ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Text("Yes"),
                          color:  Colors.teal,
                          onPressed: (){
                          },
                          highlightColor: Colors.blueGrey,
                        ),
                        FlatButton(onPressed: (){
                        }, child: Text("No"),
                          color:  Colors.teal,
                          highlightColor: Colors.blueGrey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Text(
                      "Pick An Icon:",
                      style: kActivityLabelTextStyle,
                    ),
                    margin: EdgeInsets.only(top: 12.0),
                  ),
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: _showIconGrid(catgorySnap.data),
                    ),
                  ),
                  GestureDetector(
                    onTap: catgorySnap.data.title == null
                        ? null
                        : () async {
                      var createdId = await widget.categoryBloc
                          .createNewCategory(catgorySnap.data);
                      if (createdId > 0) {
                        Navigator.of(context).pop();
                        widget.categoryBloc.getCategories();
                      } else {
                        //show error here...
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: kLightTealColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  _showIconGrid(CategoryModel category) {
    var ls = [
      Icons.account_balance_outlined,
      Icons.weekend,
      Icons.admin_panel_settings,
      Icons.widgets,
      Icons.wifi,
      Icons.wifi_lock,
      Icons.agriculture,
      Icons.work,
      Icons.airplanemode_active,
      Icons.anchor,
      Icons.apartment,
      Icons.attach_money,
      Icons.restaurant_menu,
      Icons.restore,
      Icons.attachment,
      Icons.attractions,
      Icons.ring_volume,
      Icons.room,
      Icons.audiotrack,
      Icons.extension,
      Icons.face,
      Icons.auto_fix_high,
      Icons.auto_stories,
      Icons.fastfood,
      Icons.favorite,
      Icons.backpack,
      Icons.backup,
      Icons.build,
      Icons.cake,
      Icons.commute,
      Icons.color_lens,
      Icons.credit_card,
      Icons.delete,
      Icons.delivery_dining,
      Icons.device_thermostat,
      Icons.drive_eta,
      Icons.electrical_services,
      Icons.emoji_food_beverage,
      Icons.ev_station,
      Icons.fitness_center,
      Icons.laptop,
      Icons.local_bar,
      Icons.local_gas_station,
      Icons.local_grocery_store,
      Icons.local_hospital,
      Icons.movie,
      Icons.school,
      Icons.science,
      Icons.smoking_rooms,
      Icons.sports_bar,
      Icons.sports_baseball,
      Icons.sports_esports,
      Icons.store,
      Icons.stroller,
      Icons.vpn_lock,
      Icons.wb_cloudy,
    ];

    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(ls.length, (index) {
        var iconData = ls[index];
        return IconButton(
            color: category.iconCodePoint == null
                ? Colors.black26
                : category.iconCodePoint == iconData.codePoint
                ? kDarkTealColor
                : Colors.black26,
            onPressed: () {
              var upated = category
                  .rebuild((b) => b..iconCodePoint = iconData.codePoint);
              widget.categoryBloc.updateCreateCategory(upated);
            },
            icon: Icon(
              iconData,
            ));
      }),
    );
  }
}