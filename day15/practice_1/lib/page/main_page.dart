import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_1/model/global_data_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController>();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text(controller.myName.value)),
          Obx(() => Text(controller.level.value.toString())),
          ElevatedButton(
            onPressed: () {
              controller.myName('김년병');
            },
            child: const Text('이름변경'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.level(controller.level.value + 1);
            },
            child: const Text('+1'),
          ),
        ],
      )),
    );
  }
}
