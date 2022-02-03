import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
   DateTime? selectedDate;

  void submitData() {
    final enteredTitle = textEditingController.text;
    final enteredAmount = double.parse(amountEditingController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate==null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount,selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: textEditingController,
                onSubmitted: (value) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountEditingController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(selectedDate == null ? 'No Date Chosen!':
                      'Picked Date: ${DateFormat.yMd().format(selectedDate as DateTime)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: presentDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: submitData,
              )
            ],
          ),
        ));
  }
}
