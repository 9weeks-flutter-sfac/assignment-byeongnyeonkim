import 'dart:math';

import 'package:assignment_2/model/post.dart';
import 'package:assignment_2/widget/post_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  Future<List<Post>> getData() async {
    Dio dio = Dio();
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(response.data);
      return data.map((e) => Post.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.separated(
                  separatorBuilder: (context, index) => ((index + 1) % 5) == 0
                      ? Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'Post ${index + 2} ~ ${index + 5 + 1}',
                            style: TextStyle(fontSize: 36),
                          ),
                        )
                      : SizedBox(),
                  itemBuilder: (context, index) =>
                      Posttile(post: snapshot.data![index]),
                  itemCount: snapshot.data?.length ?? 0);
            }
            return LinearProgressIndicator();
          }),
    );
  }
}
