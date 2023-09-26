import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> words = [
      {"word": "apple", "meaning": "사과", "example": "I want to eat an apple"},
      {
        "word": "paper",
        "meaning": "종이",
        "example": "Could you give me a paper"
      },
      {
        "word": "resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl"
      },
      {
        "word": "revoke",
        "meaning": "취소하다",
        "example":
            "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "withdraw",
        "meaning": "철회하다",
        "example":
            "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];
    var pageController = PageController();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                child: Icon(Icons.navigate_before),
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            itemCount: words.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  words[index]['word'].toString(),
                  style: TextStyle(
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  words[index]['meaning'].toString(),
                  style: TextStyle(
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '"${words[index]['example']!.toString()}"',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
