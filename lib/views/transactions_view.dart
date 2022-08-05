import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learningdart/views/search_view.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> transactionStream =
        FirebaseFirestore.instance.collection('Transactions').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: transactionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: AlertDialog(
                    title: const Text('Something went wrong'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchView()),
                          );
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final List storeDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storeDocs.add(a);
          }).toList();
          return Scaffold(
            appBar: AppBar(title: const Text("Transactions")),
            body: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                                  child: Text('Customer/Supplier',
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
                                  child: Text('Unit Price',
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
                      ]),
                      for (var i = 0; i < storeDocs.length; i++) ...[
                        TableRow(children: [
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(storeDocs[i]['Medicine'],
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          ),
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                        storeDocs[i]['Customer/Supplier'],
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          ),
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                        storeDocs[i]['Quantity'].toString(),
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          ),
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                        storeDocs[i]['Unit Price'].toString(),
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          ),
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(
                                        storeDocs[i]['Amount'].toString(),
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          ),
                          TableCell(
                            child: Container(
                                color: Colors.white,
                                child: Center(
                                    child: Text(storeDocs[i]['User'],
                                        style:
                                            const TextStyle(fontSize: 20.0)))),
                          )
                        ])
                      ]
                    ]),
              ),
            ),
          );
        });
  }
}
