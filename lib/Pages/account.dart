import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://drive.google.com/uc?id=1WSX4CGdkqSsCc_66Kd2HzUK8jejR5uYx&export=download';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.orangeAccent,
            iconTheme: new IconThemeData(color: Colors.white),
            title: Text(
              'MY ACCOUNT',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: _height / 12,
                ),
                new CircleAvatar(
                  radius: _width < _height ? _width / 5 : _height / 5,
                  backgroundImage: NetworkImage(imgUrl),
                ),
                new SizedBox(
                  height: _height / 25.0,
                ),
                new Divider(
                  height: 20,
                  color: Colors.black,
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
                      child: new Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    new SizedBox(
                      height: _height / 25.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 5, 7),
                      child: new Text(
                        "Test2020",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                new Divider(
                  height: 20,
                  color: Colors.black,
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 5, 5, 7),
                      child: new Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 5, 7),
                      child: new Text(
                        "Test2020@gmail.com",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                new Divider(
                  height: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          bottomNavigationBar: new MaterialButton(
            onPressed: () {},
            child: new Text(
              "sign out",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red
          ),
        )
      ],
    );
  }
}
