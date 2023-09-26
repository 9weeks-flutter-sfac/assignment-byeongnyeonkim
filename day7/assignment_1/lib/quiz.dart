import 'package:assignment_1/quizcard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

List<Map<String, dynamic>> quizs = [
  {
    "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
    "answer": 2,
    "options": ["코", "눈썹", "귀", "머리카락"]
  },
  {
    "question": "다음 중 바다가 아닌 곳은?",
    "answer": 3,
    "options": ["카리브해", "오호츠크해", "사해", "지중해"]
  },
  {
    "question": "심청이의 아버지 심봉사의 이름은?",
    "answer": 2,
    "options": ["심전도", "심학규", "심한길", "심은하"]
  },
  {
    "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
    "answer": 4,
    "options": ["정단수", "육각수", "해모수", "인당수"]
  },
  {
    "question": "택시 번호판의 바탕색은?",
    "answer": 3,
    "options": ["녹색", "흰색", "노란색", "파란색"]
  }
];

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Icon> result = [];
  var pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.blue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: result,
            ),
            leading: IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              icon: Icon(Icons.navigate_before),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                icon: Icon(Icons.navigate_next),
              ),
            ],
          ),
          body: PageView.builder(
              controller: pageController,
              itemCount: quizs.length,
              itemBuilder: (context, index) => QuizCard(
                    quiz: quizs[index],
                    onCorrect: () {
                      result.add(Icon(Icons.circle_rounded));
                      pageController.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.easeIn);
                      setState(() {});
                    },
                    onIncorrect: () {
                      result.add(Icon(Icons.close));
                      pageController.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.easeIn);
                      setState(() {});
                    },
                  )),
          floatingActionButton: result.length == quizs.length
              ? FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    result.clear();
                    pageController.jumpToPage(0);
                    setState(() {});
                  },
                )
              : null,
        ),
      ),
    );
  }
}
