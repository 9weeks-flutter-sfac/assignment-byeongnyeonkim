import 'package:flutter/material.dart';
import 'package:profileapp/model/user.dart';
import 'package:profileapp/widget/profiletile.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: -48,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                        'https://xsgames.co/randomusers/assets/avatars/male/${user.id}.jpg'),
                  ),
                ),
              ),
              Image.network(
                'https://xsgames.co/randomusers/assets/avatars/male/${user.id}.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 320,
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
            ],
          ),
          SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontSize: 32),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 16),
                    Text(
                      user.phone,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.map),
                    SizedBox(width: 16),
                    Text(
                      user.website,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 16),
                    Text(
                      user.address.street,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Divider(),
                CompanyTile(company: user.company),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
