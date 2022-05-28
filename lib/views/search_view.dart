import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learningdart/views/login_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 13.0),
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
                  onPressed: () {},
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
                padding: const EdgeInsets.only(left: 12.0, top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15.0,
                        color: Colors.black54,
                        fontFamily: 'arial'),
                  ),
                ),
              )
            ],
          )),
        ]));
  }
}
