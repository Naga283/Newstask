// @dart =2.9
import 'package:flutter/material.dart';
import 'package:task/googleScreen.dart';
import 'package:task/newsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white)),
          fontFamily: "Raleway",
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "API Tasks",
              style: TextStyle(fontSize: 24, color: Colors.black),
            )),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleMapScreen()));
                },
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Maps API",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.place,
                        color: Colors.white,
                      )
                    ])),
            FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsScreen()));
                },
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("News API",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      Icon(Icons.feed, color: Colors.white)
                    ])),
          ],
        ),
      )),
    );
  }
}
