import 'package:assignment_2/page/Mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SecretApp());
}

class SecretApp extends StatelessWidget {
  const SecretApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Neo'),
      home: Mainpage(),
    );
  }
}
