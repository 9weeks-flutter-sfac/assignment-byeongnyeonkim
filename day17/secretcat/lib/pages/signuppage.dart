import 'package:flutter/material.dart';
import 'package:secretcat/controller/signupcontroller.dart';
import 'package:get/get.dart';
import 'package:secretcat/widget/custom_button.dart';
import 'package:secretcat/widget/custom_textfield.dart';

class SignUpPage extends GetView<SignUpController> {
  static const route = '/signup';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: '이메일',
                controller: controller.emailController, //이메일 입력창
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: '비밀번호',
                controller: controller.pwController, //비밀번호 입력창
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: '비밀번호 확인',
                controller: controller.pwConfirmController, //비밀번호 재확인
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: '닉네임',
                controller: controller.userNameController, //닉네임 입력 창
              ),
            ),
            Obx(
              () => Text(
                style: TextStyle(
                  color: Colors.redAccent,
                ),
                controller.errorMsg.value, //오류 메시지 출력
              ),
            ),
            CustomButton(
              margin: EdgeInsets.all(8),
              text: '회원가입',
              onPressed: () async {
                if (await controller.signup()) {
                  Get.back(); //회원가입 완료시 페이지 뒤로 이동
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
