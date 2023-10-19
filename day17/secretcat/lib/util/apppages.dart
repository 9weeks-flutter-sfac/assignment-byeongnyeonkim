import 'package:get/get.dart';
import 'package:secretcat/pages/loginpage.dart';
import 'package:secretcat/pages/mainpage.dart';
import 'package:secretcat/pages/secretpage.dart';
import 'package:secretcat/pages/settingpage.dart';
import 'package:secretcat/pages/signuppage.dart';
import 'package:secretcat/pages/uploadpage.dart';
import 'package:secretcat/util/approutes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage()),
    GetPage(name: AppRoutes.secret, page: () => const SecretPage()),
    GetPage(name: AppRoutes.upload, page: () => const UploadPage()),
    GetPage(name: AppRoutes.setting, page: () => const SettingPage()),
  ];
}
