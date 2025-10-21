import 'package:flutter_application_1/extensions/string_extension.dart';

// The house as it is returned from the API.
class HouseBasic {
  final String url;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;

  final List<String> titles;
  final List<String> seats;

  final String currentLord;
  final String heir;
  final String overlord;
  final String founded;
  final String founder;
  final String diedOut;

  final List<String> ancestralWeapons;
  final List<String> cadetBranches;
  final List<String> swornMembers;

  String initial() {
    return name.safeIndex(6);
  }

  int id() {
    // ID is the last part of URL:
    // 'https://www.anapioficeandfire.com/api/houses/285' -> 285
    return int.parse(Uri.parse(url).pathSegments.last);
  }

  const HouseBasic({
    required this.url,
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.words,
    required this.titles,
    required this.seats,
    required this.currentLord,
    required this.heir,
    required this.overlord,
    required this.founded,
    required this.founder,
    required this.diedOut,
    required this.ancestralWeapons,
    required this.cadetBranches,
    required this.swornMembers,
  });

  factory HouseBasic.fromJson(Map<String, dynamic> json) {
    return HouseBasic(
      url: json['url'],
      name: json['name'],
      region: json['region'],
      coatOfArms: json['coatOfArms'],
      words: json['words'],
      titles: json['titles'].cast<String>(),
      seats: json['seats'].cast<String>(),
      currentLord: json['currentLord'],
      heir: json['heir'],
      overlord: json['overlord'],
      founded: json['founded'],
      founder: json['founder'],
      diedOut: json['diedOut'],
      ancestralWeapons: json['ancestralWeapons'].cast<String>(),
      cadetBranches: json['cadetBranches'].cast<String>(),
      swornMembers: json['swornMembers'].cast<String>(),
    );
  }

  static const HouseBasic mockHouseBasic = HouseBasic(
    ancestralWeapons: ["Brightroar", "Lamentation", "Orphan-Maker"],
    cadetBranches: [
      "https://www.anapioficeandfire.com/api/houses/285",
      "https://www.anapioficeandfire.com/api/houses/286",
      "https://www.anapioficeandfire.com/api/houses/287"
    ],
    coatOfArms: "A Gold Dove on a Green Field",
    currentLord: "https://www.anapioficeandfire.com/api/characters/298",
    diedOut: "During the Andals invasion",
    founder: "https://www.anapioficeandfire.com/api/characters/298",
    founded: "120 AC",
    heir: "https://www.anapioficeandfire.com/api/characters/298",
    name: "House Goodbrother of Crow Spike Keep",
    overlord: "https://www.anapioficeandfire.com/api/houses/285",
    region: "Dorne",
    seats: [
      "Godsgrace",
      "Gates of the Moon (winter)",
    ],
    swornMembers: [
      "https://www.anapioficeandfire.com/api/characters/298",
      "https://www.anapioficeandfire.com/api/characters/299",
      "https://www.anapioficeandfire.com/api/characters/300",
    ],
    titles: [
      "King of Mountain and Vale (formerly)",
      "Lord of the Eyrie",
      "Defender of the Vale",
      "Warden of the East",
    ],
    url: "https://www.anapioficeandfire.com/api/house/7",
    words: "No Foe May Pass",
  );
}
