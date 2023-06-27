// The house as it is returned from the API.
class HouseBasic {
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  
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
      name: json['name'],
      region: json['region'],
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
}