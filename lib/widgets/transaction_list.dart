import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No Transaction Added Yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${transactions[index].amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                            child: Text(
                              DateFormat.yMd().format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
