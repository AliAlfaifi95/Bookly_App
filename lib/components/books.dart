import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/Pages/book_details.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    Future getposts() async {
      var firestore = Firestore.instance;
      QuerySnapshot gn = await firestore.collection("Books").getDocuments();
      print(gn.documents);
      return gn.documents;
    }

    @override
    void initState() {

      super.initState();
    }

    return Container(
      child: FutureBuilder(
        future: getposts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (_, index) {
                return SingleBook(
                  bookName: snapshot.data[index].data["name"].toString(),
                  bookPict: snapshot.data[index].data["picture"][0].toString(),
                  bookDetails: snapshot.data[index].data["details"].toString(),
                  bookStates: snapshot.data[index].data["states"].toString(),
                  bookPrice: snapshot.data[index].data["price"].toString(),
                );
              },
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            );
          }
        },
      ),
    );
  }
}

class SingleBook extends StatelessWidget {
  String bookName;
  String bookPict;
  String bookPrice;
  String bookDetails;
  String bookStates;

  SingleBook(
      {this.bookName,
      this.bookPict,
      this.bookPrice,
      this.bookStates,
      this.bookDetails});

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
                        bookAuthor: bookStates,
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
                child: Image.network(
                  bookPict,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )),
    );
  }
}
