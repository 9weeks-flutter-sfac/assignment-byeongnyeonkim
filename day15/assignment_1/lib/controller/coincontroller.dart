import 'dart:async';

import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coin;

  CoinController({required this.coin});
  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      coin + 1;
    });
    ever(coin, (callback) {
      if (callback != 0 && callback % 10 == 0) {
        Get.snackbar('코인 $callback개 돌파', '축하합니다!');
      }
    });
  }
}
