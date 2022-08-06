import 'package:flutter/material.dart';

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

  _InventoryViewState(String medicineName) {
    _medicineName = medicineName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inventory- $_medicineName')),
        body: Column());
  }
}
