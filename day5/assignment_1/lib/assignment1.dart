// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors

import 'package:assignment_1/assignment2.dart';
import 'package:assignment_1/assignment3.dart';
import 'package:assignment_1/assignment4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const assignment1());
}

class assignment1 extends StatelessWidget {
  const assignment1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(title: '5일차 과제'),
    );
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => assginment2()));
              },
              child: Text('1번 과제'),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => assginment3()));
              },
              child: Text('2번 과제'),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => assignment4()));
              },
              child: Text('3번 과제'),
            ),
          ],
        ),
      ),
    );
  }
}
