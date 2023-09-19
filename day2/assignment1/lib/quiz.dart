import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Text("안녕 난 1번 ListView의 자식이다"),
              Text("나도! 1번 ListView의 자식이야"),
              ListView(
                shrinkWrap: true,
                children: [
                  Text("난 2번의 자식임"),
                  Text("나도 2번의 자식임"),
                ],
              ),
              Text("난 멀리 떨어져있지만 1번의 자식이야"),
            ],
          ),
        ),
      ),
    );
  }
}
