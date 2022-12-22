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
  FocusNode _focusNodeId = FocusNode();
  FocusNode _focusNodePassword = FocusNode();

  String obscureText = "숨기기";
  bool obscureState = true;
  bool idState = false;
  bool pwState = false;
  bool idColorState = false;
  bool passwordColorState = false;
  double fontSizeId = 17;
  double fontSizePw = 17;
  double fontPositionId = 15;
  double fontPositionPw = 15;

  int _counter = 0;
  bool _isLoading = false;

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
    Color idColor() {
      return idColorState == true
          ? Color.fromARGB(255, 106, 104, 104)
          : Color.fromARGB(255, 61, 59, 59);
    }

    Color passwordColor() {
      return passwordColorState == true
          ? Color.fromARGB(255, 106, 104, 104)
          : Color.fromARGB(255, 61, 59, 59);
    }

    Color getLoginbuttonColor() {
      if (idState == true && pwState == true) {
        return Color.fromARGB(255, 226, 21, 6);
      } else {
        return Colors.transparent;
      }
    }

    _focusNodeId.addListener(() {
      setState(() {
        if (_focusNodeId.hasFocus || idState == true) {
          fontSizeId = 10;
          fontPositionId = 5;
        } else {
          fontSizeId = 17;
          fontPositionId = 15;
        }
      });
    });

    _focusNodePassword.addListener(() {
      setState(() {
        //primaryColor = Colors.red;
        if (_focusNodePassword.hasFocus || pwState == true) {
          fontSizePw = 10;
          fontPositionPw = 5;
        } else {
          fontSizePw = 17;
          fontPositionPw = 15;
        }
      });
    });

    return Stack(
      children: [
        Scaffold(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 310,
                        height: 50,
                        decoration: BoxDecoration(
                            color: idColor(),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Stack(
                          children: [
                            Positioned(
                                top: fontPositionId,
                                left: 13,
                                child: Text(
                                  '이메일 주소 또는 전화번호',
                                  style: TextStyle(
                                    fontSize: fontSizeId,
                                    color: Colors.white,
                                  ),
                                )),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 320,
                                height: 50,
                                padding: EdgeInsets.fromLTRB(13, 8, 0, 0),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    if (hasFocus) {
                                      idColorState = true;
                                    } else {
                                      idColorState = false;
                                    }
                                  },
                                  child: TextFormField(
                                    validator: (String? val) {},
                                    style: TextStyle(color: Colors.white),
                                    focusNode: _focusNodeId,
                                    controller: _idController,
                                    textAlign: TextAlign.start,
                                    scrollPadding: EdgeInsets.only(bottom: 180),
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    onTap: () {
                                      //_focusNodeId.requestFocus();
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        if (text == null || text.isEmpty) {
                                          idState = false;
                                        } else {
                                          idState = true;
                                        }
                                      });

                                      print("First text field: $text");
                                    },
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 310,
                        height: 50,
                        decoration: BoxDecoration(
                            color: passwordColor(),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Stack(
                          children: [
                            Positioned(
                              top: fontPositionPw,
                              left: 13,
                              child: Text(
                                '비밀번호',
                                style: TextStyle(
                                  fontSize: fontSizePw,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                height: 50,
                                width: 320,
                                padding: EdgeInsets.fromLTRB(13, 8, 0, 0),
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    if (hasFocus) {
                                      passwordColorState = true;
                                    } else {
                                      passwordColorState = false;
                                    }
                                  },
                                  child: TextFormField(
                                    validator: (String? val) {},
                                    style: TextStyle(color: Colors.white),
                                    controller: _passwordController,
                                    focusNode: _focusNodePassword,
                                    scrollPadding: EdgeInsets.only(bottom: 180),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: obscureState,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    onTap: () {
                                      _focusNodePassword.requestFocus();
                                    },
                                    onChanged: (text) {
                                      setState(() {
                                        if (text == null || text.isEmpty) {
                                          pwState = false;
                                        } else {
                                          pwState = true;
                                        }
                                      });

                                      print("First text field: $text");
                                    },
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 250,
                              child: Container(
                                //color: Colors.green,
                                alignment: Alignment.center,
                                height: 50,
                                width: 70,
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
                        width: 310,
                        height: 50,
                        decoration: BoxDecoration(
                            color: getLoginbuttonColor(),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: TextButton(
                          onPressed: () {
                            if (idState == true && pwState == true) {
                              _incrementCounter();
                            }
                          },
                          child: Text(
                            "로그인",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
        if (_isLoading)
          const Opacity(
              opacity: 0.8,
              child: ModalBarrier(
                dismissible: false,
                color: Colors.black,
              )),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }

  void _incrementCounter() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _counter++;
      _isLoading = false;
    });
  }

  bool _isValidPhone(String val) {
    return RegExp(r'^010\d{7,8}$').hasMatch(val);
  }
}
