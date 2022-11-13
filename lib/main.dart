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
  static int currentPage = 0;
  List<String> pageName = [
    "First Page",
    "Second Page",
    "Third Page",
    "fourth Page",
  ];
  final List<String> images = <String>["page1.png", "page2.png", "page3.png"];

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Expanded(
            child: Container(
              color: Color.fromARGB(131, 0, 0, 0),
              height: 741,
              width: double.infinity,
              child: Stack(
                alignment: Alignment(0.0, 0.73),
                children: [
                  PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (index == 3)
                        return Stack(
                          children: [
                            Container(
                              height: 740,
                              width: 500,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/background.png',
                                  ),
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.5),
                                      BlendMode.dstATop),
                                ),
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
                  Expanded(
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
                                color: index == currentPage
                                    ? Colors.red
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
