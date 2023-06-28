import 'package:flutter_application_1/helper/uri_handler.dart';
import 'package:http/http.dart' as http;

class API {
  static dynamic getHouses(int page) async {
    return await http.get(URIHandler.getHousesUri(page));
  }
}
