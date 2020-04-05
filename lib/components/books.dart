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
      "details": "An American Marriage is a novel by American author Tayari Jones. It is her fourth novel and was published by Algonquin Books on February 6, 2018. In February 2018, it was chosen for Oprah's Book Club 2.0.[3] The novel also won the 2019 Women's Prize for Fiction.[4] The novel focuses on the marriage of a middle-class African-American couple, Roy and Celestial, who live in Atlanta and whose lives are torn apart when Roy is wrongfully convicted of a rape he did not commit. In an interview with The Paris Review Jones revealed that she initially wrote the book solely from Celestial's point of view and decided to add multiple points of view after her initial readers reacted negatively to Celestial.",
      "author": "Tayari Jonas"
    },
    {
      "name": "Olive, Again",
      "picture": "images/2.jpg",
      "price": 30,
      "details": "Olive, Again is a 2019 novel by Elizabeth Strout, published by Random House on October 15, 2019. It is a sequel to Olive Kitteridge. Similar to the first novel, Olive, Again takes the form of 13 short stories that are interrelated but discontinuous in terms of narrative.",
      "author": "Elizabeth Strout"
    },
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
                        )
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
