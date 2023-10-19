import 'package:flutter/material.dart';

//페이지들에 쓰이는 버튼 위젯 생성
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onPressed, this.margin});

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
        ),
        child: Text(
          style: TextStyle(
            fontSize: 16,
          ),
          text,
        ),
      ),
    );
  }
}
