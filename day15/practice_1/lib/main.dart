import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_1/model/global_data_controller.dart';
import 'package:practice_1/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GlobalDataController());
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(useMaterial3: true),
      home: MainPage(),
    );
  }
}
