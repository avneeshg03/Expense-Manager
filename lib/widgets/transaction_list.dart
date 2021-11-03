import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _tl;
  TransactionList(this._tl, this.DelTx);
  Function DelTx;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _tl.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transaction added Yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child:
                              FittedBox(child: Text('\$${_tl[index].amount}'))),
                    ),
                    title: Text(
                      _tl[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_tl[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        DelTx(_tl[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: _tl.length,
            ),
    );
  }
}
