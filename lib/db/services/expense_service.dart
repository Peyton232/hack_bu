import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:expense_manager/models/expense_model.dart';
import '../offline_db_provider.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:expense_manager/models/serializers.dart';
import 'package:flutter/material.dart';


abstract class ExpenseServiceBase {
  Future<BuiltList<ExpenseModel>> getAllCategories();
  Future<int> createExpense(ExpenseModel expense);
  Future<int> deleteExpense(int expenseId);
}

class ExpenseService implements ExpenseServiceBase {

  @override
  Future<int> deleteExpense(int expenseId) async {
    var db = await OfflineDbProvider.provider.database;
    var result = db.delete("expense", where: "id = ?", whereArgs: [expenseId]);
    return result;
  }

  @override
  Future<BuiltList<ExpenseModel>> getAllCategories() async {
    var db = await OfflineDbProvider.provider.database;
    var res = await db.query("Expense");
    if (res.isEmpty) return BuiltList();

    var list = BuiltList<ExpenseModel>();
    res.forEach((cat) {
      var expense = serializers.deserializeWith<ExpenseModel>(ExpenseModel.serializer, cat);
      list = list.rebuild((b) => b..add(expense));
    });

    return list.rebuild((b) => b..sort((a,b) => a.title.compareTo(b.title)));
  }

  @override
  Future<int> createExpense(ExpenseModel expense) async {
    //check if exists already
    var exists = await expenseExists(expense.title);

    if(exists) return 0;

    var db = await OfflineDbProvider.provider.database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id) as id FROM expense");
    int id = table.first["id"] == null ? 1 : table.first["id"] + 1;
    //insert to the table using the new id
    var resultId = await db.rawInsert(
        "INSERT Into expense (id, title, desc, iconCodePoint)"
            " VALUES (?,?,?,?)",
        [id, expense.title, expense.notes, expense.amount.toString()]);
    return resultId;
  }

  Future<bool> expenseExists(String title) async {
    var db = await OfflineDbProvider.provider.database;
    var res = await db.query("expense");
    if (res.isEmpty) return false;

    var entity = res.firstWhere(
            (b) =>
        b["title"] == title,
        orElse: () => null);

    if (entity == null) return false;

    return entity.isNotEmpty;
  }
}
