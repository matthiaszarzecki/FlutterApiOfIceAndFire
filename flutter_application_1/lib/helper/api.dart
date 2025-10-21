import 'dart:convert';
import 'package:flutter_application_1/helper/uri_handler.dart';
import 'package:flutter_application_1/models/all_houses_response.dart';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:http/http.dart' as http;

class API {
  static final instance = API();

  Future<List<HouseBasic>?> getHouses(int page) async {
    final dynamic response = await http.get(URIHandler.getHousesUri(page));

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      List<HouseBasic> newHouses =
          AllHousesResponse.fromJson(jsonDecode(response.body)).houses;

      if (newHouses.isNotEmpty) {
        return newHouses;
      } 
      return null;
    }
    return null;
  }

  Future<Character?> getCharacter(String characterURI) async {
    Uri uri = Uri.parse(characterURI);
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Character character = Character.fromJson(jsonDecode(response.body));
      return character;
    } 
    return null;
  }

  Future<HouseBasic?> getSingleHouse(String houseURI) async {
    Uri uri = Uri.parse(houseURI);
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      HouseBasic houseBasic = HouseBasic.fromJson(jsonDecode(response.body));
      return houseBasic;
    }
    return null;
  }
}
