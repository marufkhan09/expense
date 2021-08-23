import 'package:expenseplanner/widgets/chart.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expenseplanner/models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              )),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput = '';
  // String amountInput = '';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new',
      amount: 59.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),    Transaction(
      id: 't1',
      title: 'new',
      amount: 49.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),    Transaction(
      id: 't1',
      title: 'new',
      amount: 39.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),    Transaction(
      id: 't1',
      title: 'new',
      amount: 29.99,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),    Transaction(
      id: 't1',
      title: 'new',
      amount: 19.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),    Transaction(
      id: 't1',
      title: 'new',
      amount: 9.99,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add)),
        ],
        title: Text(
          "Personal Expense",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(_recentTransactions),
          TransactionList(_userTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
