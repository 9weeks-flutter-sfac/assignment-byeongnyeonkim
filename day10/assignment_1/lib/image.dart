// ignore_for_file: unused_local_variable, duplicate_ignore, prefer_const_constructors

import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

void main() {
  runApp(const image());
}

class image extends StatefulWidget {
  const image({super.key});

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    XFile? selectedImage;
    var imagePicker = ImagePicker();
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 16.0),
      child: GestureDetector(
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white12,
              image: selectedImage != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(selectedImage!.path),
                    )
                  : null),
        ),
        onTap: () async {
          var image = await imagePicker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            selectedImage = image;
            setState(() {});
          }
        },
        onDoubleTap: () => setState(() {
          selectedImage = null;
        }),
      ),
    );
  }
}
