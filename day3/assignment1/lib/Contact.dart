import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
      {super.key,
      required this.name,
      required this.phone,
      required this.imgURL});
  final String name;
  final String phone;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(
        phone,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgURL),
      ),
      trailing: Icon(Icons.call),
    );
  }
}
