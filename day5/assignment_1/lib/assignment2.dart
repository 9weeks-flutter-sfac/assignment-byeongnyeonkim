import 'package:assignment_1/assignment1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const assginment2());
}

class assginment2 extends StatelessWidget {
  const assginment2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(title: '1번 문제'),
    );
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    var scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => assignment1()));
          },
        ),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            alignment: Alignment.center,
            child: Text(
              animalList[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scrollController.jumpTo(0),
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}
