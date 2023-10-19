import 'package:assignment_1/model/user.dart';
import 'package:assignment_1/model/util/api_routes.dart';
import 'package:assignment_1/model/util/app_routes.dart';
import 'package:assignment_1/view/pages/login_page.dart';
import 'package:assignment_1/view/pages/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  String? _token;
  Dio dio = Dio();

  User? get user => _user.value;
  String? get token => _token;

  login(String id, String pw) async {
    dio.options.baseUrl = 'http://52.79.115.43:8090/';

    try {
      var res = await dio.post(
        ApiRoutes.authWithPassword,
        data: {
          'identity': id,
          'password': pw,
        },
      );
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user);
        _token = res.data['token'];
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }

  logout() {
    _user.value = null;
  }

  //유저 정보에 따른 페이지 이동
  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(AppRoutes.main);
      return;
    }
    Get.toNamed(AppRoutes.login);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
