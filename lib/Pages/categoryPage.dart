import 'package:built_collection/built_collection.dart';
import 'package:expense_manager/blocks/category_block.dart';
import 'package:expense_manager/db/services/category_service.dart';
import 'package:expense_manager/models/category_model.dart';
import 'package:expense_manager/routes/addCategory.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';


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
     body: new Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(12.0),
          width: 200.0,
          child: RaisedButton(
            child: Text("Add New"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCategory(categoryBloc: _categoryBlock,)),
              );
            },
          ),
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
                        borderRadius: BorderRadius.circular(4.0),
                        border: new Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.white)),
                    margin: EdgeInsets.all(12.0),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        IconData(category.iconCodePoint,
                            fontFamily: 'MaterialIcons'),
                        color: Theme.of(context).accentColor,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).primaryColorLight,
                        onPressed: () => _categoryBlock.deleteCategory(category.id),
                      ),
                      title: Text(
                        category.title,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      subtitle: category.desc == null ? SizedBox() : Text(
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