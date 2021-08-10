
import 'package:expenseplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  List<Transaction> transaction = [];

  TransactionList(this.transaction);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((e) {
        return Card(
          child: Row(
            children: [
              Container(
                child: Text(
                  '\$${e.amount}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                margin:
                EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
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
                      e.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      DateFormat.yMd().format(e.date),
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
      }).toList(),
    );
  }
}
