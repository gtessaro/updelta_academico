
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:updelta_academico/screens/login_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Updelta",
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
