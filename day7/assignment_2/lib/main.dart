import 'package:assignment_2/assignment2.dart';
import 'package:flutter/material.dart';
import 'package:assignment_2/assignment1.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: PageView(
          children: [assignment1(), assignment2()],
        ),
      ),
    );
  }
}
