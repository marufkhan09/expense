import 'package:expenseplanner/transaction.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          Column(
            children: transaction.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(child: Text(e.amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,

                    ),),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
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
                          child: Text(e.title),
                        ),
                        Container(
                          child: Text(e.date.toString()),
                        )
                      ],
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
