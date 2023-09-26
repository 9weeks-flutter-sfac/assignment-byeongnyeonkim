import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(assignment2());
}

class assignment2 extends StatelessWidget {
  assignment2({super.key});

  final imageUrl = [
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/10361796/pexels-photo-10361796.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/9409823/pexels-photo-9409823.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('과제 2'),
        ),
        body: Center(
          child: CarouselSlider.builder(
            itemCount: imageUrl.length,
            itemBuilder: (context, index, pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(imageUrl[index]),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 2500),
              enableInfiniteScroll: false,
            ),
          ),
        ),
      ),
    );
  }
}
