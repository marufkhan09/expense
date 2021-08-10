import 'package:flutter/material.dart';
import 'package:expenseplanner/widgets/new_transaction.dart';
import 'package:expenseplanner/widgets/transaction_list.dart';
import 'package:expenseplanner/models/transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [

    Transaction(
      id: 't1',
      title: 'new',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
        id: 't2',
        title: 'old',
        amount: 22.22,
        date: DateTime.now())

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
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        Container(
          //margin: ,
          padding: EdgeInsets.all(10),
          child: TransactionList(_userTransaction),
        ),
      ],
    );
  }
}

