import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final bookName;
  final bookPrice;
  final bookImage;

  BookDetails({this.bookName, this.bookImage, this.bookPrice});
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.myOrange,
        title: Text('BOOKLY'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
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
                        "ريال ${widget.bookPrice}",
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Quantity"),
                          content: new Text("Number of books"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("quantity"),
                    ),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.myOrange,
                  textColor: Colors.white,
                  elevation: 2.0,
                  child: new Text("Buy"),
                ),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.myOrange,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.myOrange),
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text(
              "Book Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
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
                child: new Text("Tyari jonas"),
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
                child: new Text("New"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
