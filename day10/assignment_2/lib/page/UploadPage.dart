// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class UploadPage extends StatelessWidget {
  UploadPage({super.key});

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('뒤로가기'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            fit: BoxFit.cover,
            'assets/background.jpg',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textController,
                  minLines: 7,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: '비밀을 입력하세요',
                    fillColor: Colors.white,
                    filled: true,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () async {
                      if (textController.text != '') {
                        var secret =
                            await SecretCatApi.addSecret(textController.text);
                        if (secret != null) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('비밀 공유 완료! ${secret.secret}'),
                            ),
                          );
                        }
                      }
                    },
                    child: Text('비밀 공유'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
