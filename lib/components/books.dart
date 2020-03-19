import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  var productList = [
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
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProd(
          prod_name: productList[index]['name'],
          prod_pict: productList[index]['picture'],
          prod_price: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProd extends StatelessWidget {
  final prod_name;
  final prod_pict;
  final prod_price;

  SingleProd({this.prod_name, this.prod_pict, this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      prod_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      "$prod_price",
                      style: TextStyle(
                          color: Colors.myOrange, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                child: Image.asset(
                  prod_pict,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )),
    );
  }
}
