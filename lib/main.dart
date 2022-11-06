//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //List<bool> likes;
  //int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
      //  primaryColor: Color(0xFF151026),
      //),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          //foregroundColor: Colors.white,
          //elevation: 0,
          //iconTheme: IconThemeData(
          //  color: Colors.white,

          leading: Container(
            alignment: Alignment(0.3, 0.0),
            child: (Transform.scale(
              scale: 3.5,
              child: IconButton(
                icon: Image.asset(
                  "assets/images/Logo.png",
                  //width: double.infinity,
                ),
                onPressed: () {},
              ),
            )),
          ),
          leadingWidth: 300,

          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {},
              child: Text("개인정보"),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {},
              child: Text("고객 센터"),
            ),
          ],
        ),
        // ignore: avoid_unnecessary_containers
        body:
            /*Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes, _currentPage),
          ),*/

            ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            width: 400,
            color: Colors.orange,
          ),
          Container(
            width: 400,
            color: Colors.blue,
          ),
          Container(
            width: 400,
            color: Colors.white,
          )
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(229, 9, 20, 10),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
          // alignment:Center(),
          //color: Colors.red,
          width: 10,
          height: 45,
          child: TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            child: Text("로그인"),
          ),
        ),
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i ? Colors.white : Colors.black,
      ),
    ));
  }
  return results;
}
