import 'package:assignment_1/model/util/app_routes.dart';
import 'package:assignment_1/view/pages/login_page.dart';
import 'package:assignment_1/view/pages/main_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
  ];
}
