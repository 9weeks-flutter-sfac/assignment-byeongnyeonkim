class Definition {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'],
      synonyms: map['synonyms'],
      antonyms: map['antonyms'],
      example: map['example'],
    );
  }
}
