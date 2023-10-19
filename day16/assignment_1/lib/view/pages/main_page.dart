import 'package:assignment_1/controller/auth_controller.dart';
import 'package:assignment_1/controller/main_controller.dart';
import 'package:assignment_1/view/pages/homescreen.dart';
import 'package:assignment_1/view/pages/myscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () {
          if (controller.curPage.value == 0) {
            return FloatingActionButton(
              onPressed: controller.readDocuments,
              child: const Icon(Icons.refresh),
            );
          }
          return const SizedBox();
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Obx(
              () => HomeScreen(
                user: user,
                document: controller.documents.toList(),
              ),
            ),
            MyScreen(user: user, onTap: controller.logout),
          ],
        ),
      ),
    );
  }
}
