import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(
            alignment: Alignment(0.3, 0.0),
            child: (Transform.scale(
              scale: 3.5,
              child: IconButton(
                icon: Image.asset(
                  "assets/images/Logo.png",
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
        extendBodyBehindAppBar: true,
        body: Container(
          height: 1000,
          width: 1200,
          child: const PageViewWidget(),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Color.fromRGBO(229, 9, 20, 10),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
          width: 1000,
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

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late double pageOffset = 0.0;
  double currentPage = 0.0;
  List<String> pageName = [
    "First Page",
    "Second Page",
    "Third Page",
    "fourth Page",
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        currentPage = pageOffset / 400;
        if (currentPage < 0.5) {
          currentPage = 0;
        } else if (currentPage < 1.5) {
          currentPage = 1;
        } else if (currentPage < 2.5) {
          currentPage = 2;
        } else {
          currentPage = 3;
        }

        pageOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          child: Container(
            width: 400,
            height: 1000,
            color: Colors.black,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 990,
                  width: 400,
                  alignment: Alignment(0.0, -0.5),
                  child: Image.asset(
                    "assets/images/page1.png",
                    scale: 3,
                  ),
                ),
                Container(
                  height: 990,
                  width: 400,
                  alignment: Alignment(0.0, -0.5),
                  child: Image.asset(
                    "assets/images/page2.png",
                    scale: 3,
                  ),
                ),
                Container(
                  height: 990,
                  width: 400,
                  alignment: Alignment(0.0, -0.5),
                  child: Image.asset(
                    "assets/images/page3.png",
                    scale: 3,
                  ),
                ),
                Container(
                  height: 1000,
                  width: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: (3 - pageOffset / 400) * 150,
                        child: Transform.scale(
                          scale: 1,
                          child: Container(
                            height: 900,
                            width: 400,
                            child: Image.asset(
                              'assets/images/background.png',
                              height: 900,
                              width: 400,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(153, 0, 0, 0)),
                        ),
                      ),
                      Positioned(
                        top: 380,
                        left: 90,
                        child: Container(
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
                      ),
                      Positioned(
                        top: 420,
                        left: 150,
                        child: Container(
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
                      ),
                      Positioned(
                        top: 480,
                        left: 90,
                        child: Container(
                          child: Text(
                            '넷플릭스에 가입하면 앱으로',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Retrosans',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 505,
                        left: 135,
                        child: Container(
                          child: Text(
                            '시청 가능합니다.',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Retrosans',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 157,
          bottom: 100,
          child: SizedBox(
            width: 80,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                pageName.length,
                (index) => AnimatedContainer(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 10),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: index == currentPage ? Colors.red : Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
