import 'package:dictionaryapp/model/definition.dart';

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;

  Meaning({
    required this.definitions,
    required this.partOfSpeech,
  });

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      definitions: List<Definition>.from(
          map['definitions'].map((e) => Definition.fromMap(e))),
      partOfSpeech: map['partOfSpeech'],
    );
  }
}
