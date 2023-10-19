// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  String name;
  String avatar;

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
    required this.name,
    required this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      username: map['username'] as String,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
// "id": "RECORD_ID",
//     "collectionId": "_pb_users_auth_",
//     "collectionName": "users",
//     "created": "2022-01-01 01:00:00Z",
//     "updated": "2022-01-01 23:59:59Z",
//     "username": "username123",
//     "verified": false,
//     "emailVisibility": true,
//     "email": "test@example.com",
//     "name": "test",
//     "avatar": "filename.jpg"