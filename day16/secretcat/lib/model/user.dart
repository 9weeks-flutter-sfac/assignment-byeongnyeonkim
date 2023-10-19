// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// user 직렬화
class User {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String username;
  bool verified;
  bool emailVisibility;
  String email;
  String? name;
  String? avater;

  User({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    this.avater,
    this.name,
  });

// "id": "**USER_RECORD_ID** (주말과제시 필요)",
//       "collectionId": "_pb_users_auth_",
//       "collectionName": "users",
//       "created": "2022-01-01 01:00:00Z",
//       "updated": "2022-01-01 23:59:59Z",
//       "username": "username123",
//       "verified": false,
//       "emailVisibility": true,
//       "email": "test@example.com",
//       "name": "test",
//       "avatar": "filename.jpg"

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      username: map['username'],
      verified: map['verified'],
      emailVisibility: map['emailVisibility'],
      email: map['email'],
      name: map['name'] != '' ? map['name'] as String : null,
      avater: map['avater'] != '' ? map['avater'] as String : null,
    );
  }
}
