import 'package:assignment_1/page/app_page.dart';
import 'package:assignment_1/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/coincontroller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            () => Text(
                style: TextStyle(
                  fontSize: 24,
                ),
                'Current coin : ${controller.coin.value},'),
          ),
          SizedBox(
            height: 16,
          ),
          Icon(
            FontAwesomeIcons.bitcoin,
            size: 96.0,
            color: Colors.yellow.shade700,
          ),
          TextButton(
            onPressed: () => Get.to((ShopPage())),
            child: Text('상점으로 이동하기'),
          ),
          SizedBox(
            height: 36,
          ),
          TextButton(
            onPressed: () => Get.to((AppPage())),
            child: Text('앱 정보'),
          ),
        ],
      ),
    ));
  }
}
