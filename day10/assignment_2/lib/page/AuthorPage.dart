import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  late Future result;

  @override
  void initState() {
    super.initState();
    result = SecretCatApi.fetchAuthors();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('뒤로가기'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              fit: BoxFit.cover,
              'assets/background.jpg',
            ),
            FutureBuilder(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ZoomOut(
                                    delay: Duration(milliseconds: 500 * index),
                                    child: Image.network(
                                        snapshot.data[index].avatar),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Pulse(
                                  child: Text(
                                    style: TextStyle(color: Colors.black),
                                    snapshot.data[index].name.toString(),
                                  ),
                                ),
                              ],
                            ));
                      }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ));
  }
}
