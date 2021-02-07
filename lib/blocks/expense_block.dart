import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:expense_manager/db/services/expense_service.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:rxdart/rxdart.dart';

class ExpenseBlock {
  final ExpenseServiceBase expenseService;

  ExpenseBlock(this.expenseService) {
    getExpenses();
  }

  var _createExpenseController = BehaviorSubject<ExpenseModel>();
  Stream<ExpenseModel> get createExpenseStream =>
      _createExpenseController.stream;

  updateCreateExpense(ExpenseModel cat) =>
      _createExpenseController.sink.add(cat);

  var _expenseListController = BehaviorSubject<BuiltList<ExpenseModel>>();
  Stream<BuiltList<ExpenseModel>> get expenseListStream =>
      _expenseListController.stream;

  getExpenses() {
    expenseService.getAllExpenses().then((cats) {
      _expenseListController.sink.add(cats);
    }).catchError((err) {
      _expenseListController.sink.addError(err);
    });
  }

  Future<int> createNewExpense(ExpenseModel expense) async {
    return await expenseService.createExpense(expense);
  }

  Future<void> deleteExpense(int expenseId) async {
    await expenseService.deleteExpense(expenseId).then((value) {
      //re- create list after delete
      getExpenses();
    });
  }

  dispose() {
    _createExpenseController.close();
    _expenseListController.close();
  }
}