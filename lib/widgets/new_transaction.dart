import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
          // onChanged: (value) {
          //   titleInput = value;
          // },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          // onChanged: (value) {
          //   amountInput = value;
          // },
        ),
        TextButton(
            onPressed: () {
              addTx(titleController.text,double.parse(amountController.text));
            },
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ))
      ]),
    );
  }
}
