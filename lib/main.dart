import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF151026),
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 184, 222, 239),
            title: Text('APP'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            width: double.infinity,
            height: 730,
            color: Color.fromARGB(255, 245, 240, 200),
          ),
          bottomNavigationBar: Container(
              width: double.infinity,
              height: 90,
              margin: EdgeInsets.all(0),
              color: Color.fromARGB(255, 197, 240, 248),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone),
                    Icon(Icons.message),
                    Icon(Icons.contact_page),
                  ]))),
    );
  }
}
