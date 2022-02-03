import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox
                    (child: Text('\$${transactions[index].amount}')),
                  ),
                ),
                title: Text(transactions[index].title,
                style: Theme.of(context).textTheme.headline6,),
                subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date)),
                
              ),
            );
          },
          itemCount: transactions.length,
        ));
  }
}
