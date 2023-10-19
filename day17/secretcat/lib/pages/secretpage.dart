import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/secretcontroller.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});
  static const route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () => PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.secrets.length,
            itemBuilder: (context, index) {
              var currentSecret = controller.secrets[index];
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    //비밀 텍스트
                    Text(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      currentSecret.secret,
                    ),
                    const SizedBox(height: 16),
                    //작성자
                    Text(
                      currentSecret.authorName ?? '익명',
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
