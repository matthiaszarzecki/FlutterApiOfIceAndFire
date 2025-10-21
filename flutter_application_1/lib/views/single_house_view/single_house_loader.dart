import 'package:flutter_application_1/helper/api.dart';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter_application_1/views/single_house_view/single_house_display.dart';
import 'package:flutter/material.dart';

class SingleHouseLoader extends StatefulWidget {
  const SingleHouseLoader({super.key, required this.houseBasic});

  final HouseBasic houseBasic;

  @override
  State<SingleHouseLoader> createState() => _SingleHouseLoaderState();
}

class _SingleHouseLoaderState extends State<SingleHouseLoader> {
  late final HouseUpdated houseUpdated;
  late final API _api = API.instance;

  @override
  void initState() {
    super.initState();

    houseUpdated = HouseUpdated(widget.houseBasic);
    _loadNestedData();
  }

  // TODO: To ViewModel?
  void _loadNestedData() {
    // Nested Characters

    if (widget.houseBasic.currentLord.isNotEmpty) {
      setState(() {
        houseUpdated.currentLord = _api.getCharacter(
          widget.houseBasic.currentLord,
        );
      });
    }

    if (widget.houseBasic.heir.isNotEmpty) {
      Future<Character?> newCharacter = _api.getCharacter(
        widget.houseBasic.heir,
      );
      setState(() {
        houseUpdated.heir = newCharacter;
      });
    }

    if (widget.houseBasic.founder.isNotEmpty) {
      Future<Character?> newCharacter = _api.getCharacter(
        widget.houseBasic.founder,
      );
      setState(() {
        houseUpdated.founder = newCharacter;
      });
    }

    if (widget.houseBasic.swornMembers.isNotEmpty) {
      for (String characterURL in widget.houseBasic.swornMembers) {
        Future<Character?> newCharacter = _api.getCharacter(characterURL);
        setState(() {
          houseUpdated.swornMembers.add(newCharacter);
        });
      }
    }

    // Nested Houses

    if (widget.houseBasic.overlord.isNotEmpty) {
      Future<HouseBasic?> newHouseBasic = _api.getSingleHouse(
        widget.houseBasic.overlord,
      );
      setState(() {
        houseUpdated.overlord = newHouseBasic;
      });
    }

    if (widget.houseBasic.cadetBranches.isNotEmpty) {
      for (String houseURL in widget.houseBasic.cadetBranches) {
        Future<HouseBasic?> newHouseBasic = _api.getSingleHouse(
          houseURL,
        );
        setState(() {
          houseUpdated.cadetBranches.add(newHouseBasic);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleHouseDisplay(
        houseUpdated: houseUpdated,
      ),
    );
  }
}
