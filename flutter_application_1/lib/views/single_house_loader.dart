import 'dart:convert';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:http/http.dart' as http;
import 'single_house_display.dart';

class SingleHouseLoader extends StatefulWidget {
  const SingleHouseLoader({super.key, required this.houseBasic});

  final HouseBasic houseBasic;

  @override
  State<SingleHouseLoader> createState() => _SingleHouseLoaderState();
}

class _SingleHouseLoaderState extends State<SingleHouseLoader> {
  late HouseUpdated houseUpdated;

  @override
  void initState() {
    super.initState();

    houseUpdated = HouseUpdated(widget.houseBasic);
    _loadNestedData();
  }

  void _loadNestedData() {
    // Nested Characters

    if (widget.houseBasic.currentLord.isNotEmpty) {
      setState(() {
        houseUpdated.currentLord =
            _loadCharacter(widget.houseBasic.currentLord);
      });
    }

    if (widget.houseBasic.heir.isNotEmpty) {
      setState(() {
        houseUpdated.heir = _loadCharacter(widget.houseBasic.heir);
      });
    }

    if (widget.houseBasic.founder.isNotEmpty) {
      setState(() {
        houseUpdated.founder = _loadCharacter(widget.houseBasic.founder);
      });
    }

    if (widget.houseBasic.swornMembers.isNotEmpty) {
      for (String characterURL in widget.houseBasic.swornMembers) {
        setState(() {
          Future<Character?> newCharacter = _loadCharacter(characterURL);
          houseUpdated.swornMembers.add(newCharacter);
        });
      }
    }

    // Nested Houses

    if (widget.houseBasic.overlord.isNotEmpty) {
      setState(() {
        houseUpdated.overlord = _loadSingleHouse(widget.houseBasic.overlord);
      });
    }

    if (widget.houseBasic.cadetBranches.isNotEmpty) {
      for (String houseURL in widget.houseBasic.cadetBranches) {
        setState(() {
          Future<HouseBasic?> newHouse = _loadSingleHouse(houseURL);
          houseUpdated.cadetBranches.add(newHouse);
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

  Future<HouseBasic?> _loadSingleHouse(String houseURL) async {
    Uri uri = Uri.parse(houseURL);
    final response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      HouseBasic houseBasic = HouseBasic.fromJson(jsonDecode(response.body));
      return houseBasic;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleHouseDisplay(
          houseBasic: widget.houseBasic, houseUpdated: houseUpdated),
    );
  }
}
