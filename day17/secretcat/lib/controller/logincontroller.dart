import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/authcontroller.dart';

class LoginController extends GetxController {
  var idcontroller = TextEditingController();
  var pwcontroller = TextEditingController();

  login() {
    Get.find<AuthController>().login(idcontroller.text, pwcontroller.text);
  }
}
