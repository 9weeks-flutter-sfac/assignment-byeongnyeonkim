import 'package:assignment_1/model/user.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key, required this.user, required this.onTap});

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(user.username),
          subtitle: Text(user.name),
        ),
        ListTile(
          title: const Text('로그아웃하기'),
          leading: const Icon(Icons.logout),
          onTap: onTap,
        ),
      ],
    );
  }
}
