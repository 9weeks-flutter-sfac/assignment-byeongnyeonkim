import 'package:assignment_2/model/post.dart';
import 'package:assignment_2/widget/post_bottomsheet.dart';
import 'package:flutter/material.dart';

class Posttile extends StatelessWidget {
  const Posttile({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(post.id.toString()),
        ),
        title: Text(post.title),
        subtitle: Text(post.body),
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) => PostBottomSheet(post: post));
        });
  }
}
