import 'package:assignment_1/controller/auth_controller.dart';
import 'package:assignment_1/controller/login_controller.dart';
import 'package:assignment_1/controller/main_controller.dart';
import 'package:assignment_1/view/pages/login_page.dart';
import 'package:assignment_1/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => MainController());
        Get.lazyPut(() => LoginController());
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.route),
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
