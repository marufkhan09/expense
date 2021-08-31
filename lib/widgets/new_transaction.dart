import 'dart:io';
import 'package:flutter/cupertino.dart';
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
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
                  height: 500,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            minimumYear: 2019,
                            maximumYear: DateTime.now().year,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              setState(() {
                                _selectedDate = val;
                              });
                            }),
                      ),

                      // Close the modal
                      CupertinoButton(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ))
        : showDatePicker(
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
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Platform.isIOS
                ? CupertinoTextField(
                    padding: EdgeInsets.all(15),
                    placeholder: "Title",
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(),
                  )
                : TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(),
                  ),
            SizedBox(
              height: 10,
            ),
            Platform.isIOS
                ? CupertinoTextField(
                    padding: EdgeInsets.all(15),
                    placeholder: "Amount",
                    controller: _amountController,
                    onSubmitted: (_) => _submitData(),
                  )
                : TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitData(),
                  ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          child: Text(
                            'Choose Date',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            _presentDatePicker();
                          },
                        )
                      : Container(
                          height: 48,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          decoration: BoxDecoration(
                            color: Colors.cyan[400],
                            borderRadius: BorderRadius.all(Radius.circular(35)),
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        _submitData();
                      },
                    )
                  : Container(
                      // color: Colors.purple,
                      height: 48,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.cyan[400],
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                      ),
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
        ),
      ),
    );
  }
}
