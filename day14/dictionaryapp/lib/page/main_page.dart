import 'package:dictionaryapp/model/dict.dart';
import 'package:dictionaryapp/widget/dict_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Dict? dict;
  Dio dio = Dio();

  search(String query) async {
    var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
    try {
      var res = await dio.get(url + query);
      var data = res.data.first;
      dict = Dict.fromMap(data);
      setState(() {});
    } catch (e) {
      dict = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onSubmitted: (value) {
                  search(value);
                },
              ),
            ))
          ],
        ),
        Divider(),
        if (dict != null)
          Expanded(
            child: SingleChildScrollView(
              child: DictCard(
                dict: dict!,
              ),
            ),
          ),
      ],
    )));
  }
}
