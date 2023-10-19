import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/authcontroller.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();
  var pwConfirmController = TextEditingController();
  var userNameController = TextEditingController();

  RxString errorMsg = ''.obs;

  Future<bool> signup() async {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")//email 정규 표현식
        .hasMatch(emailController.text)) {
      errorMsg('이메일 형식이 잘못되었습니다.');
      return false;
    }
    if (pwController.text.length < 9) {
      errorMsg('비밀번호는 9자리 이상이어야 합니다');
      return false;
    }
    if (pwConfirmController.text == '') {
      errorMsg('닉네임을 입력하세요');
      return false;
    }
    await Get.find<AuthController>().signup(
      emailController.text,
      pwController.text,
      pwConfirmController.text,
      userNameController.text,
    );

    return true;
  }
}
