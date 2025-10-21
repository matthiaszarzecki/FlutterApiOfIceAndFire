import 'package:flutter_application_1/helper/api.dart';
import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';
import 'single_house_display.dart';

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
      setState(() {
        houseUpdated.heir = API.instance.getCharacter(widget.houseBasic.heir);
      });
    }

    if (widget.houseBasic.founder.isNotEmpty) {
      setState(() {
        houseUpdated.founder = API.instance.getCharacter(widget.houseBasic.founder);
      });
    }

    if (widget.houseBasic.swornMembers.isNotEmpty) {
      for (String characterURL in widget.houseBasic.swornMembers) {
        setState(() {
          Future<Character?> newCharacter = API.instance.getCharacter(characterURL);
          houseUpdated.swornMembers.add(newCharacter);
        });
      }
    }

    // Nested Houses

    if (widget.houseBasic.overlord.isNotEmpty) {
      setState(() {
        houseUpdated.overlord = API.instance.getSingleHouse(widget.houseBasic.overlord);
      });
    }

    if (widget.houseBasic.cadetBranches.isNotEmpty) {
      for (String houseURL in widget.houseBasic.cadetBranches) {
        setState(() {
          Future<HouseBasic?> newHouse = API.instance.getSingleHouse(houseURL);
          houseUpdated.cadetBranches.add(newHouse);
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
