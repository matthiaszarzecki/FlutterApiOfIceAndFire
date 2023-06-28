import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';

/// The house with its nested Character and House data loaded.
class HouseUpdated {
  String name = "";
  String region = "";
  String coatOfArms = "";
  String words = "";
  String founded = "";
  String diedOut = "";
  String culture = "";

  List<dynamic> titles = [];
  List<dynamic> seats = [];
  List<dynamic> ancestralWeapons = [];

  Future<Character?>? currentLord;
  Future<Character?>? heir;
  Future<Character?>? founder;
  List<Future<Character?>?> swornMembers = [];

  Future<HouseBasic?>? overlord;
  List<Future<HouseBasic?>?> cadetBranches = [];

  HouseUpdated(HouseBasic house) {
    name = house.name;
    region = house.region;
    coatOfArms = house.coatOfArms;
    words = house.words;
    founded = house.founded;
    diedOut = house.diedOut;
    culture = house.culture;

    titles = house.titles;
    seats = house.seats;
    ancestralWeapons = house.ancestralWeapons;
  }
}