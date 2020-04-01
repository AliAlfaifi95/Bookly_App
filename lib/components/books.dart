import 'package:flutter/material.dart';
import 'package:bookly_app/Pages/book_details.dart';

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
        return SingleBook(
          book_name: productList[index]['name'],
          book_pict: productList[index]['picture'],
          book_price: productList[index]['price'],
        );
      },
    );
  }
}

class SingleBook extends StatelessWidget {
  final book_name;
  final book_pict;
  final book_price;

  SingleBook({this.book_name, this.book_pict, this.book_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: book_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // Passing details to the bookdetail page
                  builder: (context) => new BookDetails(
                        bookName: book_name,
                        bookImage: book_pict,
                        bookPrice: book_price,
                      ))),
              child: GridTile(
                footer: Container(
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            book_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                        ),
                        new Text(
                          "${book_price} SR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.red),
                        )
                      ],
                    )),
                child: Image.asset(
                  book_pict,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )),
    );
  }
}
