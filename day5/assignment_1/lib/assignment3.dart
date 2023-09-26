// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors
import 'package:assignment_1/assignment1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const assginment3());
}

class assginment3 extends StatelessWidget {
  const assginment3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(title: '2번 문제'),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key, required this.title});

  final String title;

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => assignment1()));
          },
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            onChanged: (value) => setState(() {}),
          ),
          Text(textController.text),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textController.clear();
          });
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
