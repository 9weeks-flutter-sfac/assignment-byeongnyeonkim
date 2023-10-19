import 'package:flutter/material.dart';
import 'package:secretcat/widget/custom_button.dart';
import 'package:secretcat/widget/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:secretcat/util/approutes.dart';
import 'package:secretcat/controller/logincontroller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              style: TextStyle(
                fontSize: 24,
              ),
              "비밀듣는 고양이"),
          const SizedBox(height: 16),
          //아이디 텍스트 필드
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              hintText: '아이디',
              controller: controller.idcontroller,
            ),
          ),
          //패스워드 텍스트 필드
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              hintText: '비밀번호',
              controller: controller.pwcontroller,
            ),
          ),
          CustomButton(
            margin: const EdgeInsets.all(8.0),
            text: '로그인',
            onPressed: () {
              controller.login();
            },
          ),
          //회원가입 페이지 이동
          TextButton(
            onPressed: () => Get.toNamed(AppRoutes.signup),
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            ),
            child: const Text('회원가입'),
          ),
        ],
      ),
    );
  }
}
