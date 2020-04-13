import 'package:flutter/material.dart';
import 'package:bookly_app/Pages/book_details.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  var productList = [
    {
      "name": "System Analysis and Design",
      "picture": "images/3.jpg",
      "price": 100,
      "details": "A clear presentation, organized around the systems development life cycle model. Essentials of Systems Analysis and Design is a briefer version of the authors’ successful Modern System Analysis and Design, designed for those seeking a streamlined approach to the material. This text also features the systems development life cycle model, which is used to organize the information throughout the chapters.The fifth edition emphasizes current changes in systems analysis and design.",
      "author": "Joseph Valacich"
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
          bookName: productList[index]['name'],
          bookPict: productList[index]['picture'],
          bookPrice: productList[index]['price'],
          bookDetails: productList[index]['details'],
          bookAuthor: productList[index]['author']
        );
      },
    );
  }
}

class SingleBook extends StatelessWidget {
  final bookName;
  final bookPict;
  final bookPrice;
  final bookDetails;
  final bookAuthor;
  

  SingleBook({this.bookName, this.bookPict, this.bookPrice,this.bookAuthor,this.bookDetails});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: bookName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // Passing details to the bookdetail page
                  builder: (context) => new BookDetails(
                        bookName: bookName,
                        bookImage: bookPict,
                        bookPrice: bookPrice,
                        bookDetails: bookDetails,
                        bookAuthor: bookAuthor,
                      ))),
              child: GridTile(
                footer: Container(
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            bookName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                        ),
                        new Text(
                          "${bookPrice} SR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.red),
                        ),
                      ],
                    )),
                child: Image.asset(
                  bookPict,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )),
    );
  }
}
