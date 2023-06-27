import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay(
      {super.key, required this.house, required this.houseUpdated});

  final HouseBasic house;
  final HouseUpdated houseUpdated;

  Widget _listSpacer() {
    return const SizedBox(height: 10);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    if (house.region.isNotEmpty) {
      elements.add(
        Text(
          "of ${house.region.toString()}",
          textAlign: TextAlign.center,
        ),
      );
      elements.add(_listSpacer());
    }

    if (house.coatOfArms.isNotEmpty) {
      elements.add(Text("🛡️ ${house.coatOfArms.toString()}"));
      elements.add(_listSpacer());
    }

    if (house.words.isNotEmpty) {
      elements.add(Text("🪶 ${house.words.toString()}"));
      elements.add(_listSpacer());
    }

    if (houseUpdated.currentLord != null) {
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return Text("👑 Current Lord: ${character.name}");
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.currentLord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.heir != null) {
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return Text("👱 Heir: ${character.name}");
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.heir,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.founder != null) {
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return Text("👱 Founder: ${character.name}");
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.founder,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.overlord != null) {
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              HouseBasic houseBasic = snapshot.data as HouseBasic;
              return Text("🏰 Overlord: ${houseBasic.name}");
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.overlord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (house.founded.isNotEmpty) {
      elements.add(Text("📜 Founded: ${house.founded.toString()}"));
      elements.add(_listSpacer());
    }

    if (house.diedOut.isNotEmpty) {
      elements.add(Text("💀 Died out: ${house.diedOut.toString()}"));
      elements.add(_listSpacer());
    }

    if (house.titles.length > 1) {
      elements.add(const Text("🎖️ Titles:"));
      for (var title in house.titles) {
        elements.add(Text(title));
      }
      elements.add(_listSpacer());
    }

    if (house.seats.length > 1) {
      elements.add(const Text("🏰 Seats:"));
      for (var seat in house.seats) {
        elements.add(Text(seat));
      }
      elements.add(_listSpacer());
    }

    if (house.ancestralWeapons.length > 1) {
      elements.add(const Text("Ancestral Weapons:"));
      for (var weapon in house.ancestralWeapons) {
        elements.add(Text("🗡️ ${weapon.toString()}"));
      }
      elements.add(_listSpacer());
    }

    if (house.cadetBranches.isNotEmpty) {
      elements.add(const Text("🏰 Cadet Branches:"));
      for (int i = 0; i < house.cadetBranches.length; i++) {
        elements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HouseBasic houseBasic = snapshot.data as HouseBasic;
                return Text(houseBasic.name);
              }
              return const SizedBox(height: 0);
            },
            future: houseUpdated.cadetBranches[i],
          ),
        );
      }
      elements.add(_listSpacer());
    }

    if (house.swornMembers.isNotEmpty) {
      elements.add(const Text("👱 Members:"));
      for (int i = 0; i < house.swornMembers.length; i++) {
        elements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Character character = snapshot.data as Character;
                return Text(character.name);
              }
              return const SizedBox(height: 0);
            },
            future: houseUpdated.swornMembers[i],
          ),
        );
      }
    }

    return ListView(children: elements);
  }
}
