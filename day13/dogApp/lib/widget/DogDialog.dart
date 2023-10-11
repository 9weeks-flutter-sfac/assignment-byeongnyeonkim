import 'package:dogapp/model/dog.dart';
import 'package:flutter/material.dart';

class DogDialog extends StatelessWidget {
  const DogDialog({super.key, required this.dog});
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(dog.message),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}
