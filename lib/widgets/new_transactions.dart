import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  final textEditingController = TextEditingController();
  final amountEditingController = TextEditingController();

  void submitData() {
    final enteredTitle = textEditingController.text;
    final enteredAmount = double.parse(amountEditingController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTransaction(
        enteredTitle,enteredAmount);
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
                onSubmitted: (_) =>submitData(),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.purple,
                onPressed:submitData,
              )
            ],
          ),
        ));
  }
}
