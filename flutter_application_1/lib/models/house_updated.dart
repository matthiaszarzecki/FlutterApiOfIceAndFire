import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';

/// The house with its nested Character and House data loaded.
class HouseUpdated {
  String name = "";
  String region = "";
  String coatOfArms = "";
  String words = "";

  Future<Character?>? currentLord;
  List<Future<Character?>?> swornMembers = [];

  HouseUpdated(HouseBasic house) {
    name = house.name;
    region = house.region;
    coatOfArms = house.coatOfArms;
    words = house.words;
  }
}