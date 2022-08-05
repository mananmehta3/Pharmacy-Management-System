import 'package:flutter/material.dart';
import 'package:learningdart/views/inventory_view.dart';
import 'package:learningdart/views/transactions_view.dart';
import 'employee_information_view.dart';
import 'login_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Search'), automaticallyImplyLeading: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0.0, 0.5),
                      blurRadius: 5.0,
                      spreadRadius: 0.3,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      hintText: 'Search for Medicine here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 13.0),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InventoryView()));
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: 'arial'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionView()));
                    },
                    child: const Text(
                      "Transactions",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: 'arial'),
                    ),
                  ),
                ),
              ],
            )),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: 'arial'),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmployeeInformationView()));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.person),
        ));
  }
}
