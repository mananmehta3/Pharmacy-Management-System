import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmployeeInformationView extends StatelessWidget {
  const EmployeeInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    String name = user.displayName!;
    String userID = user.uid;
    String email = user.email!;
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('lib/assets/pharmacyPhoto.jpg'),
        ),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.lightBlueAccent,
            ),
            title: Text(name),
          ),
        ),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: const Icon(
              Icons.verified_user_outlined,
              color: Colors.lightBlueAccent,
            ),
            title: Text(userID),
          ),
        ),
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.lightBlueAccent,
            ),
            title: Text(email),
          ),
        )
      ]),
    );
  }
}
