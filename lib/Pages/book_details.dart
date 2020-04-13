import 'package:bookly_app/Pages/cart.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final bookName;
  final bookPrice;
  final bookImage;
  final bookDetails;
  final bookAuthor;

  BookDetails(
      {this.bookName,
      this.bookImage,
      this.bookPrice,
      this.bookAuthor,
      this.bookDetails});
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Color buttonColor = Colors.orangeAccent;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          widget.bookName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.bookImage),
              ),
            ),
          ),
          Row(children: <Widget>[
            Expanded(
              child: ListTile(
                leading: new Text(
                  widget.bookName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                title: new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        "${widget.bookPrice} SR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new Cart()));
                  },
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  elevation: 2.0,
                  child: new Text("Buy"),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.orangeAccent,
                  ),
                  onPressed: () {}),
              new IconButton( 
                  icon: Icon(Icons.favorite_border, color: buttonColor),
                  onPressed: () {
                    setState(() {
                      if(buttonColor == Colors.orangeAccent)
                        buttonColor = Colors.red;
                        else
                        buttonColor = Colors.orangeAccent;
                    });
                  }),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text(
              "Book Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(widget.bookDetails),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text(
                  "Book Title",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text(widget.bookName),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text(
                  "Book Author",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text(widget.bookAuthor),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text(
                  "Book Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 7),
                child: new Text("Like new"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
