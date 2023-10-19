import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/authcontroller.dart';
import 'package:secretcat/controller/logincontroller.dart';
import 'package:secretcat/controller/secretcontroller.dart';
import 'package:secretcat/controller/signupcontroller.dart';
import 'package:secretcat/controller/uploadcontroller.dart';
import 'package:secretcat/pages/mainpage.dart';
import 'package:secretcat/util/apppages.dart';
import 'package:secretcat/util/approutes.dart';

void main() {
  runApp(const SecretApp());
}

class SecretApp extends StatelessWidget {
  const SecretApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignUpController(), fenix: true);
        Get.lazyPut(() => SecretController(), fenix: true);
        Get.lazyPut(() => UploadController(), fenix: true);
      }),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login, //로그인 페이지 불러오기
    );
  }
}
