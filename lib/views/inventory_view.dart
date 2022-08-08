import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learningdart/views/search_view.dart';

class InventoryView extends StatefulWidget {
  late final String medicineName;

  InventoryView(String medicine, {Key? key}) : super(key: key) {
    medicineName = medicine;
  }

  @override
  // ignore: no_logic_in_create_state
  State<InventoryView> createState() => _InventoryViewState(medicineName);
}

class _InventoryViewState extends State<InventoryView> {
  late final String _medicineName;
  late final TextEditingController _numberOfMedicine;
  late final TextEditingController _customer;
  late final TextEditingController _supplier;

  _InventoryViewState(String medicineName) {
    _medicineName = medicineName;
  }

  @override
  void initState() {
    _numberOfMedicine = TextEditingController();
    _customer = TextEditingController();
    _supplier = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _numberOfMedicine.dispose();
    _customer.dispose();
    _supplier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String qty = '';
    String price = '';
    final Stream<QuerySnapshot> medicineStream =
        FirebaseFirestore.instance.collection('Medicines').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: medicineStream,
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
          for (var i = 0; i < storeDocs.length; i++) {
            if (storeDocs[i]['Name'].toString() == _medicineName) {
              qty = storeDocs[i]['Stock'].toString();
              price = storeDocs[i]['Price'].toString();
              break;
            }
          }
          return Scaffold(
              appBar: AppBar(title: Text('Inventory - $_medicineName')),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Quantity - $qty',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Text('Price per pc - $price',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Number of Pcs.',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: _numberOfMedicine,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter the number of Medicines';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Customer',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: _customer,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Supplier',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: _supplier,
                      ),
                    ),
                  ]));
        });
  }
}
