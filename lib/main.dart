import 'package:flutter/material.dart';
import 'package:learningdart/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Login Page',
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const LoginView(),
  ));
}
