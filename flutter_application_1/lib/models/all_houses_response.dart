import 'package:flutter_application_1/models/house_basic.dart';

class AllHousesResponse {
  AllHousesResponse({required this.houses});

  final List<HouseBasic> houses;

  factory AllHousesResponse.fromJson(List<dynamic> json) {
    List<HouseBasic> houses = [];
    for (dynamic house in json) {
      houses.add(HouseBasic.fromJson(house));
    }
    return AllHousesResponse(houses: houses);
  }
}