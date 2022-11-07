//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,

        appBar: AppBar(
          backgroundColor: Colors.black,
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
        body: PageView(
          controller: pageController,
          children: [
            SizedBox(
              child: Container(
                alignment: Alignment(0.0, -0.5),
                color: Colors.black,
                child: Image.asset(
                  "assets/images/page1.png",
                  scale: 3,
                ),
              ),
            ),
            SizedBox(
              child: Container(
                alignment: Alignment(0.0, -0.7),
                color: Colors.black,
                child: Image.asset(
                  "assets/images/page2.png",
                  scale: 3,
                ),
              ),
            ),
            SizedBox(
              child: Container(
                alignment: Alignment(0.0, -0.7),
                color: Colors.black,
                child: Image.asset(
                  "assets/images/page3.png",
                  scale: 3,
                ),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '시청하려면 어떻게',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Retrosans',
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '하나요?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Retrosans',
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      '넷플릭스에 가입하면 앱으로',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Retrosans',
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Text(
                      '시청 가능합니다.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Retrosans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(229, 9, 20, 10),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
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

final PageController pageController = PageController(
  initialPage: 0,
);
