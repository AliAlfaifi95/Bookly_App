import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartBooks extends StatefulWidget {

  @override
  _CartBooksState createState() => _CartBooksState();
}

class _CartBooksState extends State<CartBooks> {
  Future getposts() async {
      var firestore = Firestore.instance;
      QuerySnapshot gn = await firestore.collection("Order").getDocuments();
      print(gn.documents);
      return gn.documents;
    }

    @override
    void initState() {
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getposts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot?.data?.length ?? 0,
              itemBuilder: (_, index) {
                return SingleCart(
                  bookName: snapshot.data[index].data["name"][0].toString(),
                  bookImage: snapshot.data[index].data["picture"][0].toString(),
                  bookPrice: snapshot.data[index].data["price"][0].toString(),
                  );
              },
             
            );
          }
        },
      ),
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
        leading: new Image.network(
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
