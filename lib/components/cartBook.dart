import 'package:flutter/material.dart';

class CartBooks extends StatefulWidget {
  @override
  _CartBooksState createState() => _CartBooksState();
}

class _CartBooksState extends State<CartBooks> {
  var booksOn = [
    {
      "name": "An American Mirriage",
      "picture": "images/1.jpg",
      "price": 15,
    },
    {
      "name": "Olive, Again",
      "picture": "images/2.jpg",
      "price": 30,
    },
    {
      "name": "System Analysis and Design",
      "picture": "images/3.jpg",
      "price": 100,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: booksOn.length,
      itemBuilder: (context, index) {
        return SingleCart(
            bookName: booksOn[index]["name"],
            bookImage: booksOn[index]["picture"],
            bookPrice: booksOn[index]["price"]);
      },
    );
  }
}

class SingleCart extends StatelessWidget {
  final bookName;
  final bookPrice;
  final bookImage;

  SingleCart({this.bookName, this.bookImage, this.bookPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          bookImage,
          width: 60.0,
          height: 200.0,
        ),
        title: new Text(bookName),
        subtitle: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topRight,
              child: new Text(
                "${bookPrice} SR",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
