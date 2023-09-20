// ignore: prefer_const_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stabucks_app/Drinktile.dart';

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
        appBar: AppBar(
          leading: Icon(Icons.navigate_before),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'new'.toUpperCase(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Drinktile(
                title: '골든 미모사 그린티',
                subtitle: 'Golden Mimosa Green Tea',
                price: 6100,
                imgUrl: 'assets/item_drink1.jpeg',
              ),
              Drinktile(
                title: '블랙 햅쌀 고봉 라떼',
                subtitle: 'Black Rice Latte',
                price: 6300,
                imgUrl: 'assets/item_drink2.jpeg',
              ),
              Drinktile(
                title: '아이스 블랙 햅쌀 고봉 라떼',
                subtitle: 'Iced Black Rice Latte',
                price: 6300,
                imgUrl: 'assets/item_drink3.jpeg',
              ),
              Drinktile(
                title: '튜메릭 라떼',
                subtitle: 'Starbucks Tumeric Latte',
                price: 6100,
                imgUrl: 'assets/item_drink4.jpeg',
              ),
              Drinktile(
                title: '아이스 스타벅스 튜메릭 라떼',
                subtitle: 'Iced Starbucks Tumeric Latte',
                price: 6100,
                imgUrl: 'assets/item_drink5.jpeg',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          fixedColor: Colors.green,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pay'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'order'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Other'),
          ],
        ),
        bottomSheet: Container(
          height: 64,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '주문할 매장을 선택해 주세요.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.expand_more, color: Colors.white),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
