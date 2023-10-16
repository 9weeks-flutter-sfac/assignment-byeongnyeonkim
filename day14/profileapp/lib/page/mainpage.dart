// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:profileapp/model/user.dart';
import 'package:profileapp/page/detailpage.dart';
import 'package:profileapp/widget/profiletile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  List<User> users = [];

  readData() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    dio.get(url).then((value) {
      if (value.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(value.data);
        users = data.map((e) => User.fromMap(e)).toList();
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('My Contents'),
        flexibleSpace: GestureDetector(
          onTap: () => setState(() {
            readData();
          }),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => FadeInRight(
          delay: Duration(milliseconds: 100 * index),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://xsgames.co/randomusers/assets/avatars/male/${users[index].id}.jpg',
                  scale: 1),
            ),
            title: Text(
              users[index].name,
            ),
            subtitle: Text(users[index].email),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      user: users[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
