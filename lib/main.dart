import 'package:ewallet/data/database.dart';
import 'package:hive_flutter/adapters.dart';

import './widgets/balance.dart';

import './widgets/add_descriptions.dart';
import 'package:flutter/material.dart';
import './models/total_income.dart';
import './widgets/transaction_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TotalIncomeAdapter());
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _mybox = Hive.box('mybox');
  TransactionDataBase db = TransactionDataBase();

  @override
  void initState() {
    if (_mybox.get('TRANSACTIONS') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void _addDescription(String des, int amt) {
    setState(() {
      db.transactions.add(TotalIncome(
          title: des, creditDebitAmount: amt, date: DateTime.now()));
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gelasio',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(204, 135, 203, 8),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'Gelasio',
              ),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Transform.translate(
            offset: const Offset(-28.6, 0),
            child: const Text(
              'eWallet',
              style: TextStyle(fontFamily: 'Satisfy'),
            ),
          ),
          leading: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.brown,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Balance(userDetails: db.transactions),
              AddDescriptions(addDescription: _addDescription),
              TransactionList(transactions: db.transactions)
            ],
          ),
        ),
        //body: ,
      ),
    );
  }
}
