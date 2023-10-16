import 'package:assignment_1/controller/coincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text('현재 보유한 코인 ${controller.coin.value}'),
          ),
          TextButton(
            onPressed: () => controller.coin(0),
            child: Text('코인 리셋'),
          ),
        ],
      )),
    );
  }
}
