import 'dart:js';

import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'SecretPage.dart';
import 'AuthorPage.dart';
import 'UploadPage.dart';

void main() {
  runApp(const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animaton, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animaton.drive(tween),
          child: child,
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.yellow,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/camel.png'),
                ),
                SizedBox(height: 8),
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  '임금님 귀는 낙타귀',
                ),
                SizedBox(height: 56),
                ListTile(
                  tileColor: Colors.white,
                  title: Text('임금님 등장!'),
                  subtitle: Text('무엇을 숨겼는고'),
                  trailing: Image.asset('assets/camel.png'),
                  leading: Image.asset('assets/king.png'),
                  onTap: () =>
                      Navigator.of(context).push(_createRoute(SecretPage())),
                ),
                SizedBox(height: 24),
                ListTile(
                  tileColor: Colors.white,
                  title: Text('비밀을 숨긴자가 누구인가!'),
                  subtitle: Text('뒷 산에 오른사람'),
                  trailing: Image.asset('assets/camel.png'),
                  leading: Image.asset('assets/people.png'),
                  onTap: () =>
                      Navigator.of(context).push(_createRoute(AuthorPage())),
                ),
                SizedBox(height: 24),
                ListTile(
                  tileColor: Colors.white,
                  title: Text('뒷 산에 오르기'),
                  subtitle: Text('이건 못 듣겠지?'),
                  trailing: Image.asset('assets/camel.png'),
                  leading: Image.asset('assets/king.png'),
                  onTap: () =>
                      Navigator.of(context).push(_createRoute(UploadPage())),
                )
              ],
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
