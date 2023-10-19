// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/util/approutes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          //비밀 페이지로 이동
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.black12,
              title: const Text('비밀 보기'),
              subtitle: const Text('모든 비밀을 확인하기'),
              leading: const Icon(Icons.android),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Get.toNamed(AppRoutes.secret),
            ),
          ),
          //작성자 페이지로 이동
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.black12,
              title: const Text('비밀 만들기'),
              subtitle: const Text('나의 비밀 작성하기'),
              leading: const Icon(Icons.android),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Get.toNamed(AppRoutes.upload),
            ),
          ),
          //비밀 업로드 페이지로 이동
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.black12,
              title: const Text('설정'),
              subtitle: const Text('내 정보 설정하기'),
              leading: const Icon(Icons.android),
              trailing: const Icon(Icons.navigate_next),
              onTap: () => Get.toNamed(AppRoutes.setting),
            ),
          ),
        ],
      ),
    );
  }
}
