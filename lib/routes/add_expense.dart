import 'package:built_collection/built_collection.dart';
import 'package:expense_manager/Data/constants.dart';
import 'package:expense_manager/blocks/expense_block.dart';
import 'package:expense_manager/db/services/expense_service.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:flutter/material.dart';
import '../insults/Insults.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_manager/models/category_model.dart';
import 'package:expense_manager/blocks/category_block.dart';
import 'package:expense_manager/db/services/category_service.dart';

import '../insults/Insults.dart';

import '../globals.dart' as globals;

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  CategoryBlock categoryBloc;
  FocusNode _focus = new FocusNode();
  bool _showKeyboard = false;
  TextEditingController _amountTextController = TextEditingController();
  bool expense = true;

  @override
  void initState() {
    super.initState();
    categoryBloc = CategoryBlock(CategoryService());
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _showKeyboard = _focus.hasFocus;
    });
  }

  int selectedCategoryId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Add New Expense/Gain"),
        backgroundColor: kDarkTealColor,
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Expense"),
                      onPressed: (){
                        expense = true;
                      },
                      highlightColor: Colors.blueGrey,
                    ),
                    FlatButton(onPressed: (){
                      expense = false;
                    }, child: Text("Gain"),
                    highlightColor: Colors.blueGrey,
                    )
                  ],
                )
            ),
            Container(
              child: StreamBuilder(
                stream: categoryBloc.categoryListStream,
                builder: (_, AsyncSnapshot<BuiltList<CategoryModel>> snap) {
                  if (!snap.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return Wrap(
                    children: List.generate(
                      snap.data.length,

                          (int index) {
                        var categoryModel = snap.data[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          child: ChoiceChip(
                            selectedColor: Theme.of(context).accentColor,
                            selected: categoryModel.id == selectedCategoryId,
                            label: Text(categoryModel.title),
                            onSelected: (selected) {
                              setState(() {
                                //selectedCategoryId = categoryModel.id;
                                if (categoryModel.title == "gas" || categoryModel.title == "Bills" ||categoryModel.title == "Groceries"){
                                  selectedCategoryId = 1;
                                } else {
                                  selectedCategoryId = 0;
                                }
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: TextField(
                        controller: _amountTextController,
                        focusNode: _focus,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Amount",
                        ),
                        maxLines: 1,
                        onChanged: (String text) {},
                        onSubmitted: (String text) {
                          if (expense) {
                            globals.totalCash.subAmount(double.parse(text));

                            if (selectedCategoryId == 0) {
                              _showMaterialDialog();
                            }
                          } else {
                            globals.totalCash.addAmount(double.parse(text));
                          }
                        },
                      ),
                    ),
                  ),
                  //_showKeyboard ? _shortcutKeyboard() : SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _shortcutKeyboard() {
  //   // var keyboardKeys = [
  //   //   "50",
  //   //   "100",
  //   //   "500",
  //   //   "1000",
  //   // ];
  //   bool expense = true;
  //   return Row(
  //     children: <Widget>[
  //       Container(
  //         color: kLightTealColor,
  //         child: Text(
  //           '50',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         color: kLightTealColor,
  //         child: Text(
  //           '100',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         color: kLightTealColor,
  //         child: Text(
  //           '500',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  //   // ListView.builder(
  //   //   scrollDirection: Axis.horizontal,
  //   //   itemCount: keyboardKeys.length,
  //   //   itemBuilder: (_, index) {
  //   //     var key = keyboardKeys[index];
  //   //     Insults meanWords = new Insults();
  //   //     return GestureDetector(
  //   //       onTap: () {
  //   //         _showMaterialDialog();
  //   //         setState(() {});
  //   //         setState(
  //   //           () {
  //   //             _amountTextController.value =
  //   //                 _amountTextController.value.copyWith(
  //   //               text: key,
  //   //               selection: TextSelection.collapsed(offset: key.length),
  //   //             );
  //   //           },
  //   //         );
  //   //       },
  //   //       child: Container(
  //   //         padding: EdgeInsets.symmetric(horizontal: 6.0),
  //   //         decoration: BoxDecoration(
  //   //           borderRadius: BorderRadius.circular(15.0),
  //   //           //border: Border.all(color: Theme.of(context).accentColor),
  //   //         ),
  //   //         child: Text(
  //   //           key,
  //   //           style: TextStyle(
  //   //             color: Colors.white,
  //   //             fontSize: 15.0,
  //   //           ),
  //   //         ),
  //   //       ),
  //   //     );
  //   //   },
  //   // ),
  // }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Insult"),
          content: new Text(globals.insultobj.getInsult),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
