import 'package:dictionaryapp/model/dict.dart';
import 'package:dictionaryapp/model/meanig.dart';
import 'package:dictionaryapp/widget/meaningcard.dart';
import 'package:flutter/material.dart';

class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dict});
  final Dict dict;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dict.word,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dict.meanings.length,
            itemBuilder: (context, index) {
              return MeaningCard(meaning: dict.meanings[index]);
            },
          )
        ],
      ),
    ));
  }
}
