import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  TableCell(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text('Medicine',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  ),
                  TableCell(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text('Quantity',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  ),
                  TableCell(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text('Customer/Supplier',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  ),
                  TableCell(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text('Amount',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  ),
                  TableCell(
                    child: Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text('User',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  )
                ])
              ]),
        ),
      ),
    );
  }
}
