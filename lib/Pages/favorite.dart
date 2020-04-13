import 'package:bookly_app/components/books2.dart';
import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'FAVORITE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Books(),
    );
  }
}