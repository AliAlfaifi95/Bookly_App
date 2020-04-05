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
        backgroundColor: Colors.orangeAccent,
        title: Text('BOOKLY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                  onPressed: () {},
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
                  icon: Icon(Icons.favorite_border, color: Colors.orangeAccent),
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
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
            child: new Text(
              "Similer books",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Similer books section
          Container(
            height: 360.0,
            child: SimilerBooks(),
          ),
        ],
      ),
    );
  }
}

class SimilerBooks extends StatefulWidget {
  @override
  _SimilerBooks createState() => _SimilerBooks();
}

class _SimilerBooks extends State<SimilerBooks> {
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
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SimSingleBook(
          bookName: productList[index]['name'],
          bookPict: productList[index]['picture'],
          bookPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SimSingleBook extends StatelessWidget {
  final bookName;
  final bookPict;
  final bookPrice;

  SimSingleBook({this.bookName, this.bookPict, this.bookPrice});
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
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                        ),
                        new Text(
                          "${bookPrice} SR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
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
