import 'package:dictionaryapp/model/meanig.dart';
import 'package:flutter/material.dart';

class MeaningCard extends StatelessWidget {
  const MeaningCard({super.key, required this.meaning});
  final Meaning meaning;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meaning.partOfSpeech,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meaning.definitions.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(meaning.definitions[index].definition),
            ),
          ),
        ],
      ),
    );
  }
}
