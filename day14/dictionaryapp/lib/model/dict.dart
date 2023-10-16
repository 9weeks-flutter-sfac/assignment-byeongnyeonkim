// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:dictionaryapp/model/license.dart';
import 'package:dictionaryapp/model/meanig.dart';
import 'package:dictionaryapp/model/phonetic.dart';

class Dict {
  String word;
  String? phonetice;
  List<Phonetic> phonetices;
  List<Meaning> meanings;
  License license;
  List<String> SourceUrls;

  Dict({
    required this.word,
    required this.phonetice,
    required this.phonetices,
    required this.meanings,
    required this.license,
    required this.SourceUrls,
  });

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'],
      phonetice: map['phonetice'],
      phonetices: List<Phonetic>.from(
          map['phonetices'].map((e) => Phonetic.fromMap(e))),
      meanings:
          List<Meaning>.from(map['meanings'].map((e) => Meaning.fromMap(e))),
      license: License.fromMap(map['license']),
      SourceUrls: List<String>.from(['SourceUrls']),
    );
  }
}

// class Phonetic {
//   String text;
//   String audio;
//   String sourceUrl;
//   License license;
// }

// class License {
//   String name;
//   String url;
// }

// class Meaning {
//   String partOfSpeech;
//   List<Definition> definitions;
// }

// class Definition {
//   String definition;
//   List<String> synonyms;
//   List<String> antonyms;
//   String? example;
// }
