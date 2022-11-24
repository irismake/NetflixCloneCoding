import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  LoginRoutePage createState() => LoginRoutePage();
}

class LoginRoutePage extends State<LoginRoute> {
  final TextEditingController _textController = TextEditingController();
  //const LoginRoute({super.key});
  final myController = TextEditingController();
  String obscureText = "숨기기";
  bool obscureState = true;
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(246, 132, 129, 129);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Container(
          alignment: Alignment.center,
          child: IconButton(
            color: Colors.white,
            iconSize: 25,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        leadingWidth: 100,
        title: Container(
          width: 100,
          height: 45,
          alignment: Alignment(0.1, 0.0),
          child: Image.asset(
            "assets/images/Logo.png",
            scale: 1,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            child: Text("고객 센터"),
          ),
        ],
      ),
      body: Container(
        width: 500,
        height: double.infinity,
        color: Color.fromARGB(255, 28, 28, 28),
        alignment: Alignment(0.0, 0.1),
        child: Container(
            height: 350,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(246, 132, 129, 129),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 40, 5),
                      child: TextField(
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: '이메일 주소 또는 전화번호',
                        ),
                        onChanged: (text) {
                          // 현재 텍스트필드의 텍스트를 출력
                          print("First text field: $text");
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(246, 132, 129, 129),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                  child: Row(
                    children: [
                      Container(
                        //color: Colors.blue,
                        height: 40,
                        width: 240,
                        padding: EdgeInsets.fromLTRB(10, 15, 40, 0),
                        child: TextFormField(
                          //controller: _textController,
                          //onSubmitted: _handleSubmitted,
                          cursorColor: Colors.white,
                          obscureText: obscureState,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: '비밀번호',
                          ),
                          onChanged: (text) {
                            print("First text field: $text");
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 60,
                        //margin: EdgeInsets.all(10),
                        child: TextButton(
                          child: Text(
                            obscureText,
                            style: TextStyle(
                                color: Color.fromARGB(255, 204, 201, 201)),
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = obscureState == true ? '숨기기' : '표시';
                              obscureState = !obscureState;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton(
                    onPressed: (() => _handleSubmitted(_textController.text)),
                    child: Text(
                      "로그인",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 30,
                  child: Text(
                    '비밀번호 재설정',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 40,
                  child: Text(
                    '로그인 시 Google reCAPTCHA를 이용해 사용자가\n로봇이 아님을 확인합니다. 자세히 알아보기',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _handleSubmitted(String text) {
    //_textController.clear();
  }
}
