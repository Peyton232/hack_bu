import '../Data/constants.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomAppBar.dart';
import 'package:built_collection/built_collection.dart';
import 'package:expense_manager/blocks/category_block.dart';
import 'package:expense_manager/db/services/category_service.dart';
import 'package:expense_manager/models/category_model.dart';
import 'package:expense_manager/routes/addCategory.dart';
import '../models/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryBlock _categoryBlock;

  @override
  initState() {
    super.initState();
    _categoryBlock = CategoryBlock(CategoryService());
  }

  @override
  Widget build(BuildContext context) {
    return _getCategoryTab();
  }

  Widget _getCategoryTab() {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[700],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCategory(
                  categoryBloc: _categoryBlock,
                ),
              ),
            );
          },
          child: Icon(Icons.add)),
      body: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: <Widget>[],
              ),
            ),
            height: 0,
            /*
            child: RaisedButton(
              child: Text("Add New"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCategory(categoryBloc: _categoryBlock,)),
                );
              },
            ),
            */
          ),
          StreamBuilder(
            stream: _categoryBlock.categoryListStream,
            builder:
                (_, AsyncSnapshot<BuiltList<CategoryModel>> categoryListSnap) {
              if (!categoryListSnap.hasData) return CircularProgressIndicator();

              var lsCategories = categoryListSnap.data;

              return Expanded(
                child: ListView.builder(
                  itemCount: lsCategories.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    var category = lsCategories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.all(12.0),
                      child: ListTile(
                        onTap: () {
                          print('Overview of that category');
                        },
                        leading: Icon(
                          IconData(category.iconCodePoint,
                              fontFamily: 'MaterialIcons'),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.black54,
                          onPressed: () =>
                              _categoryBlock.deleteCategory(category.id),
                        ),
                        title: Text(
                          category.title,
                        ),
                        subtitle: category.desc == null
                            ? SizedBox()
                            : Text(
                          category.desc,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}