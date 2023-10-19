import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/authcontroller.dart';
import 'package:secretcat/util/apiroutes.dart';
import 'package:secretcat/util/network.dart';

class UploadController extends GetxController {
  var textController = TextEditingController();
  String resultMsg = '';
  RxBool isAnonymous = false.obs;

  //비밀 업로드
  uploadSecret() async {
    if (textController.text == '') return;

    var controller = Get.find<AuthController>();
    try {
      var res = await Network.dio.post(
        ApiRoutes.uploadSecret,
        data: {
          'secret': textController.text,
          'author': controller.user!.id,
          'authorName': !isAnonymous.value ? controller.user!.username : ''
        },
      );

      if (res.statusCode == 200) {
        resultMsg = '비밀을 성공적으로 업로드했습니다.';
      }
    } on DioException catch (e) {
      resultMsg = '[ERROR]비밀 업로드에 실패하였습니다.';
      print(e);
    }
  }

  checkAnonymous(bool? value) {
    if (value != null) {
      isAnonymous(value);
    }
  }
}
