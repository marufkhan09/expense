import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      addTx(enteredTitle, enteredAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => submitData(),
        ),
        TextButton(
            onPressed: () {
              submitData();
            },
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ))
      ]),
    );
  }
}
