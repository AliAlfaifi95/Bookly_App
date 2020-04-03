import 'package:flutter/material.dart';
import 'package:bookly_app/Pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.myOrange
    ),
    home: Login(),
  ));
}
