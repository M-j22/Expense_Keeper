import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Text(
                'No tranactions Added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: constraints.maxHeight*0.6,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover),
              ),
            ],
          );
        })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}
