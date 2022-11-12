import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        body: const PageViewWidget(),
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
  final List<String> images = <String>[
    "page1.png",
    "page2.png",
    "page3.png",
    "page4.png"
  ];

  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Expanded(
            child: SizedBox(
              height: 600.0,
              width: double.infinity,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: pageName.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(
                      "assets/images/${images[index]}",
                      scale: 3,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Center(
          child: Expanded(
            child: SizedBox(
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
                        color: index == _PageViewWidgetState.currentPage
                            ? Colors.red
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
