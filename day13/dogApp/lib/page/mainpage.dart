import 'package:dio/dio.dart';
import 'package:dogapp/model/dog.dart';
import 'package:dogapp/widget/DogDialog.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Dog?> getData() async {
      var url = 'https://dog.ceo/api/breeds/image/random';
      Dio dio = Dio();

      var res = await dio.get(url);
      if (res.statusCode == 200) {
        return Dog.fromMap(res.data);
      }
      return null;
    }

    //https://dog.ceo/api/breeds/image/random
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            print(index);
            return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data?.message == null
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    DogDialog(dog: snapshot.data!));
                          },
                          child: Image.network(
                            snapshot.data!.message,
                            fit: BoxFit.cover,
                          ),
                        );
                }
                return CircularProgressIndicator();
              },
            );
          }),
    );
  }
}
