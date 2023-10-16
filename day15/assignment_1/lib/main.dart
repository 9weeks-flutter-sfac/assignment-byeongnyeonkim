// ignore_for_file: unused_local_variable

import 'package:assignment_1/controller/appcontroller.dart';
import 'package:assignment_1/controller/coincontroller.dart';
import 'package:assignment_1/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appcontroller = Get.put(Appcontroller(
        appAuthor: '김병년',
        appName: '비트코인',
        appVersion: '1.10',
        lastUpdated: DateTime.now(),
        appPackageName: 'appPackageName',
        isSound: false,
        isNotificationOn: true));
    var controller = Get.put(CoinController(coin: 0.obs));
    return GetMaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
