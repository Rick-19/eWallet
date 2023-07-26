import 'package:hive_flutter/adapters.dart';

import '../models/total_income.dart';

final _myBox = Hive.box('mybox');

class TransactionDataBase {
  List<TotalIncome> transactions = [];

  void createInitialData() {
    transactions = [];
  }

  void loadData() {
    transactions = _myBox.get('TRANSACTIONS').cast<TotalIncome>();
  }

  void updateDataBase() {
    _myBox.put('TRANSACTIONS', transactions);
  }
}
