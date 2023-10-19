import 'package:assignment_1/model/document.dart';
import 'package:assignment_1/model/user.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user, required this.document});

  final User user; //사용자 정보
  final List<Document> document; //document 리스트

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: const TextStyle(
              fontSize: 32,
            ),
            '${user.username}님 안녕하세요',
          ),
          //documnet를 리스트뷰로 출력
          ListView.builder(
            shrinkWrap: true,
            itemCount: document.length,
            itemBuilder: (context, index) {
              var doc = document[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        doc.title),
                    Text(doc.content),
                    if (doc.attachment_url != null)
                      Image.network(doc.attachment_url!),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
