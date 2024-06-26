// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}
