import 'package:assignment_1/controller/auth_controller.dart';
import 'package:assignment_1/model/document.dart';
import 'package:assignment_1/model/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;
  Dio dio = Dio();
  RxList<Document> documents = RxList();

  onPageTapped(int value) {
    pageController.jumpToPage(value);
    curPage(value);
  }

  logout() {
    Get.find<AuthController>().logout();
  }

  readDocuments() async {
    dio.options.baseUrl = 'http://52.79.115.43:8090/';
    var token = Get.find<AuthController>().token;

    try {
      documents.clear();
      var res = await dio.get(
        ApiRoutes.documents,
        options: Options(headers: {'authorization': token}),
        data: {token: token},
      );
      if (res.statusCode == 200) {
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(res.data['items']);
        documents.addAll(data.map((e) => Document.fromMap(e)).toList().obs);
      }
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
