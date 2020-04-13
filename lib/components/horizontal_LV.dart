import 'package:flutter/material.dart';
import 'package:bookly_app/Pages/categories.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLoc: 'images/cat/General_Knowledge.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Philosophy.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Social_Scinces.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Languages.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Science.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Technology.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Literature.jpg',
          ),
          Category(
            imageLoc: 'images/cat/History&Geography.jpg',
          ),
          Category(
            imageLoc: 'images/cat/Arts.jpg',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLoc;

  Category({this.imageLoc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => new Categories()));
        },
        child: Container(
          width: 130.0,
          child: ListTile(
            title: Image.asset(
              imageLoc,
              width: 200.0,
              height: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}
