import 'package:expenseplanner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'new',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(id: 't2', title: 'old', amount: 22.22, date: DateTime.now())
  ];
  String titleInput = '';
  String amountInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              child: Text("Chart!"),
            ),
          ),
          Container(
            //margin: ,
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) {
                      titleInput = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    onChanged: (value) {
                      amountInput = value;
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        print(titleInput);
                        print(amountInput);
                      },
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.purple),
                      )),
                ],
              ),
            ),
          ),
          Column(
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
          ),
        ],
      ),
    );
  }
}
