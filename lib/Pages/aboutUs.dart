import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'ABOUT US',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:new ListView(
        children: <Widget>[
          new Container(
            child: GridTile(
                child: Image.asset('images/logo.png'),
            ) ,
          ),
          Row(children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                    "Thank you so much for using our app",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color: Colors.white),
                  ),
              ),
            ),
          ]),
           Row(children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                    "This is our 2020 graduation's project",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color: Colors.white),
                  ),
              ),
            ),
          ]),
          new Divider(color: Colors.white),
          Row(children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                    "To contact with us:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color: Colors.white),
                  ),
              ),
            ),
          ]),
          Row(children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                    "info@bookly.com",
                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                  ),
              ),
            ),
          ]),
        ]
        
      )
    );
  }
}