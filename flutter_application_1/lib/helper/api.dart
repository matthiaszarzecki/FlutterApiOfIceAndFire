import 'dart:convert';
import 'package:flutter_application_1/extensions/int_extension.dart';
import 'package:flutter_application_1/helper/uri_handler.dart';
import 'package:flutter_application_1/models/all_houses_response.dart';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:http/http.dart' as http;

class API {
  static final instance = API();

  /// Fetches a list of HouseBasics
  Future<List<HouseBasic>?> getHouses(int page) async {
    final dynamic response = await http.get(URIHandler.getHousesUri(page));

    final int responseCode = response.statusCode;
    if (responseCode.isSuccessful()) {
      List<HouseBasic> newHouses = AllHousesResponse.fromJson(
        jsonDecode(response.body),
      ).houses;

      if (newHouses.isNotEmpty) {
        return newHouses;
      }
      return null;
    }
    return null;
  }

  /// Fetches the specified Character
  Future<Character?> getCharacter(String characterURI) async {
    Uri uri = Uri.parse(characterURI);
    final response = await http.get(uri);

    final int responseCode = response.statusCode;
    if (responseCode.isSuccessful()) {
      Character character = Character.fromJson(jsonDecode(response.body));
      return character;
    }
    return null;
  }

  /// Fetches the specified HouseBasic
  Future<HouseBasic?> getSingleHouse(String houseURI) async {
    Uri uri = Uri.parse(houseURI);
    final response = await http.get(uri);

    final int responseCode = response.statusCode;
    if (responseCode.isSuccessful()) {
      HouseBasic houseBasic = HouseBasic.fromJson(jsonDecode(response.body));
      return houseBasic;
    }
    return null;
  }
}
