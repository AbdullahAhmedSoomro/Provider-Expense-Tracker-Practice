import 'package:flutter/cupertino.dart';
import 'package:practice/models/expense_model.dart';

class ExpenseState extends ChangeNotifier {
  List<ExpenseModel> a = [];
  updateData(ExpenseModel entry) {
    a.add(entry);
    notifyListeners();
  }
}
