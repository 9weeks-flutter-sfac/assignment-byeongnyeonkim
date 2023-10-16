// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:profileapp/model/address.dart';
import 'package:profileapp/model/company.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromMap(map['address']),
      phone: map['phone'],
      website: map['website'],
      company: Company.fromMap(map['company']),
    );
  }
}
