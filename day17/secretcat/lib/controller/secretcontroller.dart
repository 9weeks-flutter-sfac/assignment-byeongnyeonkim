import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:secretcat/model/secret.dart';
import 'package:secretcat/util/apiroutes.dart';
import 'package:secretcat/util/network.dart';

class SecretController extends GetxController {
  RxList<Secret> secrets = RxList();

  readSecrets() async {
    try {
      //네트워크 데이터 요청
      var res = await Network.dio.get(ApiRoutes.getSecrets);

      if (res.statusCode == 200) {
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(res.data['items']);

        secrets.addAll(data.map((e) => Secret.fromMap(e)).toList());
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    readSecrets(); //비밀 데이터 가져오기
  }
}
