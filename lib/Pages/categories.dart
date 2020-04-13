import 'package:bookly_app/components/books2.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('BOOKLY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Books(),
      
    );
  }
}