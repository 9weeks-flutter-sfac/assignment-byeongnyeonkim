import 'package:flutter/material.dart';
import 'package:assignment_1/image.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('포토 네컷'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 4, itemBuilder: ((context, index) => image())),
      ),
    );
  }
}
