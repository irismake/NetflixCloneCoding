import 'package:flutter/material.dart';

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
  bool loginState = false;
  bool pwState = false;
  double fontSizeId = 17;
  double fontSizePw = 17;
  double fontPositionId = 15;
  double fontPositionPw = 15;

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(255, 84, 83, 83);
    Color getColor() {
      if (loginState == true && pwState == true) {
        return Colors.red;
      } else {
        return Colors.transparent;
      }
    }

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
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
        child: Container(
          height: 741,
          width: 400,
          color: Color.fromARGB(255, 28, 28, 28),
          alignment: Alignment(0.0, 0.1),
          child: Container(
            height: 350,
            width: 350,
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 320,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 320,
                              height: 50,
                              padding: EdgeInsets.only(left: 8),
                              child: TextFormField(
                                validator: (String? val) {},
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white),
                                controller: _idController,
                                scrollPadding: EdgeInsets.only(bottom: 180),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                enableSuggestions: false,
                                autocorrect: false,
                                onTap: () {},
                                onChanged: (text) {
                                  setState(() {
                                    if (text == null || text.isEmpty) {
                                      loginState = false;
                                      fontSizeId = 17;
                                      fontPositionId = 15;
                                    } else {
                                      loginState = true;
                                      fontSizeId = 10;
                                      fontPositionId = 5;
                                    }
                                  });
                                  print("First text field: $text");
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: primaryColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: fontPositionId,
                              left: 20,
                              child: Text(
                                '이메일 주소 또는 전화번호',
                                style: TextStyle(
                                  fontSize: fontSizeId,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              height: 50,
                              width: 320,
                              //color: Colors.orange,
                              padding: EdgeInsets.only(left: 8),
                              child: TextFormField(
                                validator: (String? val) {
                                  /*if (val == null || val.isEmpty) {
                                    pwState = false;
                                    return 'Please enter some text';
                                  } else {
                                    pwState = true;
                                  }*/
                                },
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.white),
                                controller: _passwordController,
                                scrollPadding: EdgeInsets.only(bottom: 180),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: obscureState,
                                enableSuggestions: false,
                                autocorrect: false,
                                onTap: () {},
                                onChanged: (text) {
                                  setState(() {
                                    if (text == null || text.isEmpty) {
                                      pwState = false;
                                      fontSizePw = 17;
                                      fontPositionPw = 15;
                                    } else {
                                      pwState = true;
                                      fontSizePw = 10;
                                      fontPositionPw = 5;
                                    }
                                  });

                                  print("First text field: $text");
                                },
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: primaryColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: fontPositionPw,
                            left: 20,
                            child: Text(
                              '비밀번호',
                              style: TextStyle(
                                fontSize: fontSizePw,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 265,
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 60,
                              child: TextButton(
                                child: Text(
                                  obscureText,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 231, 227, 227)),
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                          color: getColor(),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextButton(
                        onPressed: () {
                          if (loginState == true &&
                              pwState ==
                                  true) {} /*else if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }*/
                        },
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

bool _isValidPhone(String val) {
  return RegExp(r'^010\d{7,8}$').hasMatch(val);
}
