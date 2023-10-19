// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
//secret 직렬화
class Secret  {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String username;
  String secret;
  String? author;
  String? authorName;

  Secret({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.username,
    required this.secret,
    this.author,
    this.authorName,
  });

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      username: map['username'] as String,
      secret: map['secret'] as String,
      author: map['author'] != '' ? map['author'] as String : null,
      authorName: map['authorName'] != '' ? map['authorName'] as String : null,
    );
  }
}
