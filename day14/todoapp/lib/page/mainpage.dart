import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widget/bottomsheet.dart';
import 'package:todoapp/widget/todocard.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/todos';
  List<Todo> todos = [];
  TodoFilter todoFilter = TodoFilter.all;

  readTodos() async {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      setState(() => todos = data.map((e) => Todo.fromMap(e)).toList());
    }
  }

  @override
  void initState() {
    super.initState();
    readTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(),
            ),
          ),
          title: Text('Todo App'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => FilterBottomSheet(
                            filter: TodoFilter.incompleted,
                            onApply: (value) {
                              print(value);
                              setState(() => todoFilter = value);
                            },
                          ));
                },
                icon: Icon(Icons.filter_alt)),
            IconButton(
                onPressed: () {
                  readTodos();
                },
                icon: Icon(Icons.refresh_sharp)),
          ],
        ),
        body: ListView.builder(
            itemCount: filterMaker(todos).length,
            itemBuilder: (context, index) => TodoCard(
                  todo: filterMaker(todos)[index],
                )));
  }

  List<Todo> filterMaker(List<Todo> value) {
    switch (todoFilter) {
      case TodoFilter.completed:
        return value.where((element) => element.completed == true).toList();
      case TodoFilter.all:
        return value;
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}
