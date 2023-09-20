import 'package:flutter/material.dart';

class Musictile extends StatelessWidget {
  const Musictile(
      {super.key,
      required this.title,
      required this.artist,
      required this.duration,
      required this.albumImg});
  final String title;
  final String artist;
  final String duration;
  final String albumImg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        maxLines: 2,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(albumImg),
      ),
      trailing: Icon(Icons.more_vert),
      subtitle: Row(
        children: [
          Icon(Icons.check_circle, size: 16),
          SizedBox(width: 4),
          Flexible(
            child: Text(
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
                artist),
          ),
          SizedBox(width: 4),
          Text(style: TextStyle(fontWeight: FontWeight.bold), duration),
        ],
      ),
    );
  }
}
