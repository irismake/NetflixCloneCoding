import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  LoginRoutePage createState() => LoginRoutePage();
}

class LoginRoutePage extends State<LoginRoute> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ScrollController _scrollController;

  String obscureText = "숨기기";
  bool obscureState = true;
  bool buttonState = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(246, 132, 129, 129);
    Color clickColor = Color.fromARGB(255, 232, 23, 23);
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
      body: GestureDetector(
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          controller: _scrollController,
          child: Container(
            height: 741,
            width: 400,
            color: Color.fromARGB(255, 34, 34, 34),
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
                          color: primaryColor,
                          /*buttonColor == true
                              ? Color.fromARGB(246, 225, 14, 14)
                              : Color.fromARGB(255, 93, 92, 92),*/
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: EdgeInsets.fromLTRB(10, 10, 40, 5),
                      child: TextField(
                        controller: _idController,
                        scrollPadding: EdgeInsets.only(bottom: 180),
                        keyboardType: TextInputType.emailAddress,

                        onTap: () {
                          buttonState = true;
                        },
                        //onSubmitted: _handleSubmitted(),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          //focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: '이메일 주소 또는 전화번호',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (text) {
                          print("First text field: $text");
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 240,
                            padding: EdgeInsets.fromLTRB(10, 15, 40, 0),
                            child: TextField(
                              controller: _passwordController,
                              scrollPadding: EdgeInsets.only(bottom: 180),

                              keyboardType: TextInputType.emailAddress,

                              onTap: () {
                                primaryColor = clickColor;
                              },
                              //onSubmitted: _handleSubmitted(),
                              cursorColor: Colors.white,
                              obscureText: obscureState,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: '비밀번호',
                                hintStyle: TextStyle(color: Colors.white),
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
                            child: TextButton(
                              child: Text(
                                obscureText,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 204, 201, 201)),
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText =
                                      obscureState == true ? '숨기기' : '표시';
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
                        onPressed: (() => _handleSubmitted()),
                        // _idController.text, _passwordController.text)),
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
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          '비밀번호 재설정',
                          style: TextStyle(color: Colors.white),
                        ),
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
        ),
      ),
    );
  }

  void _handleSubmitted() {
    _idController.clear();
    _passwordController.clear();
  }
}
