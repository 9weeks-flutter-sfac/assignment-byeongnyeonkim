import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  OptionCard(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.onTap});
  final String imgUrl;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.network(imgUrl, fit: BoxFit.cover)),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              style: TextStyle(
                color: Colors.black,
              ),
              '[담기]',
            )
          ],
        ),
      ),
    );
  }
}
