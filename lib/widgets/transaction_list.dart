import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];
  final deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text('No Transaction Added Yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: mediaQuery.size.width > 460
                      ? ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                      ))
                    ),
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,

                          ),
                          label: Text('delete button'),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        ),
                ),
              );
            },
          );
  }
}
