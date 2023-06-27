import 'package:flutter_application_1/models/house.dart';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay(
      {super.key, required this.house, required this.houseUpdated});

  final House house;
  final HouseUpdated houseUpdated;

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    if (house.region.isNotEmpty) {
      elements.add(Text("of ${house.region.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.coatOfArms.isNotEmpty) {
      elements.add(Text("🛡️ ${house.coatOfArms.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.words.isNotEmpty) {
      elements.add(Text("🪶 ${house.words.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (houseUpdated.currentLord != null) {
      elements.add(
        FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Character character = snapshot.data as Character;
                return Text("Current Lord: ${character.name}");
              }
              return const SizedBox(height: 0);
            },
            future: houseUpdated.currentLord),
      );
      elements.add(const SizedBox(height: 10));
    }

    if (house.heir.isNotEmpty) {
      elements.add(Text("Heir: ${house.heir.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.overlord.isNotEmpty) {
      elements.add(Text("Overlord: ${house.overlord.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.founded.isNotEmpty) {
      elements.add(Text("Founded: ${house.founded.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.founder.isNotEmpty) {
      elements.add(Text("Founder: ${house.founder.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.diedOut.isNotEmpty) {
      elements.add(Text("💀 Died out: ${house.diedOut.toString()}"));
      elements.add(const SizedBox(height: 10));
    }

    if (house.titles.length > 1) {
      elements.add(const Text("Titles:"));
      for (var title in house.titles) {
        elements.add(Text(title));
      }
      elements.add(const SizedBox(height: 10));
    }

    if (house.seats.length > 1) {
      elements.add(const Text("Seats:"));
      for (var seat in house.seats) {
        elements.add(Text(seat));
      }
      elements.add(const SizedBox(height: 10));
    }

    if (house.ancestralWeapons.length > 1) {
      elements.add(const Text("Ancestral Weapons:"));
      for (var weapon in house.ancestralWeapons) {
        elements.add(Text("🗡️ ${weapon.toString()}"));
      }
      elements.add(const SizedBox(height: 10));
    }

    if (house.cadetBranches.isNotEmpty) {
      elements.add(const Text("Cadet Branches:"));
      for (var cadetBranch in house.cadetBranches) {
        elements.add(Text(cadetBranch));
      }
      elements.add(const SizedBox(height: 10));
    }

    if (house.swornMembers.isNotEmpty) {
      elements.add(const Text("Members:"));
      for (var member in house.swornMembers) {
        elements.add(Text(member));
      }
      elements.add(const SizedBox(height: 10));
    }

    return ListView(children: elements);
  }
}
