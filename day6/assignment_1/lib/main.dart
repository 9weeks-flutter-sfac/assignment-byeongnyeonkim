import 'package:assignment_1/assignment1.dart';
import 'package:assignment_1/assignment2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: assignment_1(),
    );
  }
}

class assignment_1 extends StatelessWidget {
  const assignment_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: assignment1(),
          ),
          Container(
            child: assignment2(),
          ),
        ],
      ),
    );
  }
}
