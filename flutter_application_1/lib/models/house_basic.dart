// The house as it is returned from the API.
class HouseBasic {
  final String url;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final String culture;

  final List<dynamic> titles;
  final List<dynamic> seats;

  final String currentLord;
  final String heir;
  final String overlord;
  final String founded;
  final String founder;
  final String diedOut;

  final List<dynamic> ancestralWeapons;
  final List<dynamic> cadetBranches;
  final List<dynamic> swornMembers;

  String initial() {
    return name[6];
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
    required this.culture,
  });

  factory HouseBasic.fromJson(Map<String, dynamic> json) {
    return HouseBasic(
      url: json['url'],
      name: json['name'],
      region: json['region'],
      culture: json['culture'],
      coatOfArms: json['coatOfArms'],
      words: json['words'],
      titles: json['titles'],
      seats: json['seats'],
      currentLord: json['currentLord'],
      heir: json['heir'],
      overlord: json['overlord'],
      founded: json['founded'],
      founder: json['founder'],
      diedOut: json['diedOut'],
      ancestralWeapons: json['ancestralWeapons'],
      cadetBranches: json['cadetBranches'],
      swornMembers: json['swornMembers'],
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
    culture: "Northmen",
  );
}
