import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
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
          //color: Colors.yellow,
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
            //color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(246, 57, 55, 55),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  margin: EdgeInsets.fromLTRB(0.0, 0.1, 0.5, 0.1),
                  child: TextButton(
                    //style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: null,
                    child: Text(
                      "이메일 주소 또는 전화번호",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(246, 57, 55, 55),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                  child: TextButton(
                    //style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: null,
                    child: Text(
                      "비밀번호",
                      style: TextStyle(color: Colors.white),
                    ),
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
                  //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),

                  child: TextButton(
                    //style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: null,
                    child: Text(
                      "로그인",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  //color: Colors.pink,
                  width: 300,
                  height: 30,
                  child: Text(
                    '비밀번호 재설정',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  //color: Colors.pink,
                  width: 300,
                  height: 40,
                  child: Text(
                    '로그인 시 Google reCAPTCHA를 이용해 사용자가\n로봇이 아님을 확인합니다. 자세히 알아보기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
