// ignore_for_file: unused_import

import 'package:assignment_1/controller/appcontroller.dart';
import 'package:assignment_1/controller/coincontroller.dart';
import 'package:assignment_1/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Appcontroller>();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.snackbar('앱 버젼', '현재 앱 버젼은 ${controller.appVersion} 입니다.');
              },
              child: const Text('앱 버젼 확인하기'),
            ),
            TextButton(
              onPressed: () {
                Get.snackbar('앱을 만든사람', '앱 만든 사람은 ${controller.appAuthor} 입니다.',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text('앱 개발자 확인하기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                    '앱 수정 날짜', '${controller.lastUpdated}로 업데이트 되었습니다.',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text('앱 수정 날짜'),
            ),
            TextButton(
              onPressed: () {
                Get.snackbar('앱을 만든사람', '앱 만든 사람은 ${controller.appAuthor} 입니다.',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text('앱 개발자 확인하기'),
            ),
          ],
        ),
      ),
    );
  }
}
