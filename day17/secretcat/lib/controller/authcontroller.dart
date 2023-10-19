import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:secretcat/model/user.dart';
import 'package:secretcat/pages/loginpage.dart';
import 'package:secretcat/pages/mainpage.dart';
import 'package:secretcat/pages/signuppage.dart';
import 'package:secretcat/util/apiroutes.dart';
import 'package:secretcat/util/approutes.dart';
import 'package:secretcat/util/network.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  User? get user => _user.value; //유저 정보 읽기

  //로그인
  login(String id, String pw) async {
    try {
      var res = await Network.dio.post(ApiRoutes.authWithPassword,
          data: {
            'identity': id,
            'password': pw,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user); //유저 정보 저장
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }

  //로그 아웃
  logout() {
    _user.value = null; //유저 정보 삭제
  }

  //회원 가입
  signup(
    String email,
    String password,
    String passwordConfirm,
    String username,
  ) async {
    try {
      await Network.dio.post(
        ApiRoutes.signup,
        data: {
          'email': email,
          'password': password,
          'passwordConfirm': passwordConfirm,
          'username': username,
        },
      );
    } on DioException catch (e) {
      print(e);
    }
  }

  //유저 정보에 따른 페이지 이동
  _handleAuthChanged(User? data) {
    //유저 정보가 있으면 메인페이지로 이동
    if (data != null) {
      Get.offNamed(AppRoutes.main);
      return;
    }
    //유저 정보가 없으면 로그인 페이지로 이동
    Get.offAllNamed(AppRoutes.login);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    //유저 정보가 변경되면 실행
    ever(_user, _handleAuthChanged);
  }
}
