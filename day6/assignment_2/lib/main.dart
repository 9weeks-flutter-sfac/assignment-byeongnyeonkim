import 'package:assignment_2/adminpage.dart';
import 'package:flutter/material.dart';

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
  final List<Map> foodList = [
    {'img': 'assets/option_beer.png', 'name': '맥주'},
    {'img': 'assets/option_bokki.png', 'name': '떡볶이'},
    {'img': 'assets/option_kimbap.png', 'name': '김밥'},
    {'img': 'assets/option_omurice.png', 'name': '오무라이스'},
    {'img': 'assets/option_pork_cutlets.png', 'name': '돈까스'},
    {'img': 'assets/option_ramen.png', 'name': '라면'},
    {'img': 'assets/option_udon.png', 'name': '우동'},
  ];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(7, (index) {
                  return GestureDetector(
                    onTap: () => setState(
                      () {
                        foodOrder.add(foodList[index]['name']);
                      },
                    ),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                foodList[index]['img'],
                              ),
                            ),
                          ),
                          Text(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            foodList[index]['name'].toString(),
                          ),
                          Text(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            '[담기]',
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
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
