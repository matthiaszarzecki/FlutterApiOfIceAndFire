import 'dart:convert';
import 'package:flutter_application_1/helper/uri_handler.dart';
import 'package:flutter_application_1/models/all_houses_response.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<HouseBasic>?> getHouses(int page) async {
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
}
