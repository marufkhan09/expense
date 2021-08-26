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
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);
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
                child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen'
                      : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.cyan[400],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Center(
          child: Container(
            // color: Colors.purple,
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.cyan[400],
              borderRadius: BorderRadius.all(Radius.circular(5)),
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
        ),
      ]),
    );
  }
}
