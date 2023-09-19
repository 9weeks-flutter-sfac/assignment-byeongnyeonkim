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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    "오늘의 하루는"),
                Text(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  "어땠나요?",
                ),
                SizedBox(
                  height: 280,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: EdgeInsets.all(40.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          '우울함',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(40.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                            ],
                          ),
                        ),
                        child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          '행복함',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(40.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.green,
                              Colors.blue,
                            ],
                          ),
                        ),
                        child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          '상쾌함',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: 90,
                  padding: EdgeInsets.all(8),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/profile1.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    '김병년'),
                                Text(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                    '프론트엔드\nHTML, Flutter'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(color: Colors.white, Icons.add),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
