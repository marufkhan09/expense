import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount);
    }

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: _titleController,
          onSubmitted: (_) => _submitData(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: _amountController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => _submitData(),
        ),
        Container(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: Text(_selectedDate == null
                    ? 'No Date Chosen'
                    : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}'),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.purple,
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: TextButton(
              onPressed: () {
                _submitData();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ]),
    );
  }
}
