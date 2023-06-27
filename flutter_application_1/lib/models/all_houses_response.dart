import 'package:flutter_application_1/models/house.dart';

class AllHousesResponse {
  AllHousesResponse({required this.houses});

  final List<House> houses;

  factory AllHousesResponse.fromJson(List<dynamic> json) {
    List<House> houses = [];
    for (var house in json) {
      houses.add(House.fromJson(house));
    }
    return AllHousesResponse(houses: houses);
  }
}