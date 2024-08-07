import 'package:flutter_application_1/extensions/string_extension.dart';

class Character {
  final String url;
  final String name;
  final String culture;
  final String born;
  final String died;

  const Character({
    required this.url,
    required this.name,
    required this.culture,
    required this.born,
    required this.died
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      url: json['url'],
      name: json['name'],
      culture: json['culture'],
      born: json['born'],
      died: json['died']
    );
  }

  bool hasInformation() {
    return culture != "" || born != "" || died != "";
  }

  String initial() {
    return name.safeIndex(0);
  }

  /*bool hasInformation:  {
    // We are leaving out the "url" field as that URL
    // leads back to this character, and not anywhere else.
    culture.exists ||
      born.exists ||
      died.exists ||
      titles.hasNonEmptyEntries ||
      aliases.hasNonEmptyEntries ||
      tvShowAppearances.hasNonEmptyEntries ||
      portrayedBy.hasNonEmptyEntries
  }*/
}

/*
let url: String
  let name: String
  let displayName: String
  let culture: String
  let born: String
  let died: String
  let titles: [String]
  let aliases: [String]
  let tvShowAppearances: [String]
  let portrayedBy: [String]
*/