import 'package:flutter/material.dart';

//페이지들에 쓰이는 텍스트필드 위젯 생성
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLines,
      required this.hintText,
      required this.controller});

  final int? maxLines;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusColor: Colors.redAccent,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        hintText: hintText,
      ),
    );
  }
}
