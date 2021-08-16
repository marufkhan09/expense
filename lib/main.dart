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
        primarySwatch: Colors.blue,
      ),
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
              onTap: () {}, child: NewTransaction(_addNewTransaction));
        });
  }

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(id: 't2', title: 'old', amount: 22.22, date: DateTime.now())
  ];

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
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            elevation: 5.0,
            child: Text("Chart!"),
          ),
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
