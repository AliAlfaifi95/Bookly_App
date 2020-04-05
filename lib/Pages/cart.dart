import 'package:flutter/material.dart';
import 'package:bookly_app/components/cartBook.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
      body: new CartBooks(),
      bottomNavigationBar: new Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: new Text("Total:"),
                  subtitle: new Text("230 SR"),
                ),
              ),
              Expanded(
                child: new MaterialButton(
                  onPressed: () {},
                  child: new Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orangeAccent,
                ),
              ),
            ],
          )),
    );
  }
}
