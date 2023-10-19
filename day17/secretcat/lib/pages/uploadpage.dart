import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcat/controller/uploadcontroller.dart';
import 'package:secretcat/widget/custom_button.dart';
import 'package:secretcat/widget/custom_textfield.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 36,
            ),

            const SizedBox(height: 16),
            //비밀 입력 텍스트 필드
            CustomTextField(
              maxLines: 6,
              hintText: '비밀을 입력하세요.',
              controller: controller.textController,
            ),
            //익명 체크박스
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    activeColor: Colors.redAccent,
                    value: controller.isAnonymous.value,
                    onChanged: controller.checkAnonymous,
                  ),
                ),
                const Text('익명'),
              ],
            ),
            //비밀 업로드 버튼
            CustomButton(
              text: '비밀 업로드',
              onPressed: () async {
                await controller.uploadSecret();
                if (controller.textController.text != '') {
                  Get.back();
                  Get.snackbar('비밀 업로드', controller.resultMsg);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
