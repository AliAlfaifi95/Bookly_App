import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:bookly_app/components/horizontal_LV.dart';
import 'package:bookly_app/components/books.dart';
import 'package:bookly_app/Pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage('images/1.jpg'),
          AssetImage('images/2.jpg'),
          AssetImage('images/3.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 0.0,
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Colors.myOrange,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.myOrange,
        title: Text('BOOKLY'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Hasan'),
              accountEmail: Text('info@hasan.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.myOrange,
              ),
            ),
            //Body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.myOrange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.myOrange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.myOrange),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favorites'),
                leading: Icon(Icons.favorite, color: Colors.myOrange),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About us'),
                leading: Icon(Icons.info, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          imageCarousel,
          //padding widget
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Horizontal listview
          HorizontalList(),

          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text('Recent books',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          //gridView
          Container(
            height: 320.0,
            child: Books(),
          ),
        ],
      ),
    );
  }
}
