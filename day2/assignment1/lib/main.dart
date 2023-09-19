import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text("이테디"),
                subtitle: Text("010-1000-2000"),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/100/100"),
                ),
              ),
              ListTile(
                title: Text("이테디"),
                subtitle: Text("010-1000-2000"),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/100/100"),
                ),
              ),
              ListTile(
                title: Text("이테디"),
                subtitle: Text("010-1000-2000"),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/100/100"),
                ),
              ),
              ListTile(
                title: Text("이테디"),
                subtitle: Text("010-1000-2000"),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/100/100"),
                ),
              ),
              ListTile(
                title: Text("이테디"),
                subtitle: Text("010-1000-2000"),
                trailing: Icon(Icons.call),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/100/100"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
