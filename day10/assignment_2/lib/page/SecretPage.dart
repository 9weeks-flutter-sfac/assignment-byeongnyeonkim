import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class SecretPage extends StatelessWidget {
  SecretPage({super.key});

  var pageController = PageController();

  @override
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
              'assets/background.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            FutureBuilder(
                future: SecretCatApi.fetchSecrets(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return FadeInRight(
                            delay: Duration(milliseconds: 250),
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FadeInRight(
                                    child: Image.asset(
                                      width: 80,
                                      height: 80,
                                      'assets/camel.png',
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    snapshot.data![index].secret.toString(),
                                  ),
                                  Text(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    snapshot.data![index].author?.username ??
                                        '익명',
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ));
  }
}
