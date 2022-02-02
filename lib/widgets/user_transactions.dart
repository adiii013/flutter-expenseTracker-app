import 'package:expense_tracker/widgets/new_transactions.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 'h1', title: 'Shoes', amount: 69.9, date: DateTime.now()),
    // Transaction(id: 'h1', title: 'Shoes', amount: 69.9, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx =
        Transaction(id:DateTime.now().toString(),title: txTitle, amount: txAmount, date: DateTime.now());
  
      setState(() {
        _userTransaction.add(newTx);
      });
  
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addNewTransaction),
       TransactionList(_userTransaction)
       ],
    );
  }
}
