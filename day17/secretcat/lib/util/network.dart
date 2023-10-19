import 'package:dio/dio.dart';

class Network {
  //Network 클래스 이용 baseUrl 설정
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'http://52.79.115.43:8090/',
    ),
  );
}
