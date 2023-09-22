import 'package:assignment_1/assignment1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const assignment4());
}

class assignment4 extends StatelessWidget {
  const assignment4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(title: '3번 문제'),
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
  bool isSun = false;
  bool isMoon = false;
  bool isStar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => assignment1()));
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('태양'),
              leading: Icon(
                  color: isSun ? Colors.red : Colors.grey, Icons.light_mode),
              trailing: IconButton(
                onPressed: () => setState(() {
                  isSun = !isSun;
                }),
                icon: Icon(Icons.play_arrow),
              ),
            ),
            ListTile(
              title: Text('달'),
              leading: Icon(
                  color: isMoon ? Colors.yellow : Colors.grey,
                  Icons.nightlight),
              trailing: IconButton(
                onPressed: () => setState(() {
                  isMoon = !isMoon;
                }),
                icon: Icon(Icons.play_arrow),
              ),
            ),
            ListTile(
              title: Text('별'),
              leading:
                  Icon(color: isStar ? Colors.orange : Colors.grey, Icons.star),
              trailing: IconButton(
                onPressed: () => setState(() {
                  isStar = !isStar;
                }),
                icon: Icon(Icons.play_arrow),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '키거나 끄고싶은 아이콘을 입력하세요!',
              ),
              onSubmitted: (value) {
                setState(() {
                  switch (value) {
                    case '태양':
                      isSun = !isSun;
                      break;
                    case '달':
                      isMoon = !isMoon;
                      break;
                    case '별':
                      isStar = !isStar;
                      break;
                    case '태양 달 별':
                      isSun = !isSun;
                      isMoon = !isMoon;
                      isStar = !isStar;
                      break;
                  }
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isSun = false;
            isMoon = false;
            isStar = false;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
