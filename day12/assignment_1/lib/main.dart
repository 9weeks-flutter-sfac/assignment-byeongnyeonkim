import 'package:assignment_2/adminpage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OptionCard.dart';

void main() {
  runApp(const KioskApp());
}

class KioskApp extends StatelessWidget {
  const KioskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: '분식왕 이테디 주문하기');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> foodOrder = [];

  Dio dio = Dio();
  Future? result;

  SharedPreferences? prefs;

  Future<List<dynamic>> getData() async {
    var res = await dio
        .get('http://52.79.115.43:8090/api/collections/options/records');
    if (res.statusCode == 200) {
      return res.data['items'];
    }
    return [];
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var myList = prefs!.getStringList('myMenuList');
      foodOrder = myList ?? [];
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onDoubleTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminPage()));
            },
            child: Text(widget.title)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              '주문 리스트'),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: foodOrder.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodOrder.length,
                    itemBuilder: (context, index) {
                      return Chip(
                          label: Text(foodOrder[index]),
                          onDeleted: () {
                            setState(() {
                              foodOrder.removeAt(index);
                            });
                          });
                    },
                  )
                : Text('주문한 옵션이 없습니다.'),
          ),
          Text(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              '음식'),
          Expanded(
            //음식 갤러리 형식으로 만들기
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return OptionCard(
                          imgUrl: snapshot.data![index]['imageUrl'],
                          name: snapshot.data![index]['menu'],
                          onTap: () {
                            if (prefs != null) {
                              prefs!.setStringList('myMenuList', foodOrder);
                            }
                            foodOrder.add(snapshot.data![index]['menu']);
                            setState(() {});
                          },
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ]),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: foodOrder.isNotEmpty ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('결제하기'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
