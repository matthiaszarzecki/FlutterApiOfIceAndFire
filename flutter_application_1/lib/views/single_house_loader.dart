import 'dart:convert';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:http/http.dart' as http;
import 'single_house_display.dart';

class SingleHouseLoader extends StatefulWidget {
  const SingleHouseLoader({super.key, required this.house});

  final HouseBasic house;

  @override
  State<SingleHouseLoader> createState() => _SingleHouseLoaderState();
}

class _SingleHouseLoaderState extends State<SingleHouseLoader> {
  late HouseUpdated houseUpdated;

  @override
  void initState() {
    super.initState();

    houseUpdated = HouseUpdated(widget.house);

    if (widget.house.currentLord.isNotEmpty) {
      setState(() {
        houseUpdated.currentLord = _loadCharacter(widget.house.currentLord);
      });
    }

    if (widget.house.swornMembers.isNotEmpty) {
      for (String characterURL in widget.house.swornMembers) {
        setState(() {
          Future<Character?> newCharacter = _loadCharacter(characterURL);
          houseUpdated.swornMembers.add(newCharacter);
        });
      }
    }
  }

  Future<Character?> _loadCharacter(String characterURL) async {
    Uri uri = Uri.parse(characterURL);
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Character character = Character.fromJson(jsonDecode(response.body));
      return character;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          SingleHouseDisplay(house: widget.house, houseUpdated: houseUpdated),
    );
  }
}
