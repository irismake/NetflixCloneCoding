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
          backgroundColor: Colors.black,
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
        body:
            Container(height: 1000, width: 700, child: const PageViewWidget()),
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
  late PageController pageController;
  double pageOffset = 0;

  int currentPage = 0;
  List<String> pageName = [
    "First Page",
    "Second Page",
    "Third Page",
    "fourth Page",
  ];
  final List<String> images = <String>["page1.png", "page2.png", "page3.png"];

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1.0);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              //color: Colors.amber,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    double pagePosition = -pageOffset.abs();
                    print(pagePosition);
                  });
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  // controller = PageController(viewportFraction: 0.5);
                  if (index == 3)
                    return Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Transform.scale(
                              scale: 1,
                              child: Container(
                                alignment:
                                    Alignment(-pageOffset.abs() + index, 0),
                                child: Image.asset(
                                  'assets/images/background.png',
                                  height: 700,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(184, 0, 0, 0)),
                            ),
                          ),
                          Positioned(
                            top: 280,
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
                            top: 320,
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
                            top: 390,
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
                            top: 415,
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
                    );
                  else
                    return Container(
                      color: Colors.black,
                      height: 600,
                      width: 350,
                      alignment: Alignment(0.0, -0.7),
                      child: Image.asset(
                        "assets/images/${images[index]}",
                        scale: 3,
                      ),
                    );
                },
              ),
            ),
          ),
          Positioned(
            left: 157,
            bottom: 100,
            child: Container(
              width: 80,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  pageName.length, // 도트개수
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
      ),
    );
  }
}
