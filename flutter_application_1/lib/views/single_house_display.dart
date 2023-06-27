import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay(
      {super.key, required this.houseBasic, required this.houseUpdated});

  final HouseBasic houseBasic;
  final HouseUpdated houseUpdated;

  Widget _listSpacer() {
    return const SizedBox(height: 10);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    if (houseUpdated.region.isNotEmpty) {
      elements.add(
        Text(
          "of ${houseUpdated.region.toString()}",
          textAlign: TextAlign.center,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.coatOfArms.isNotEmpty) {
      elements.add(Text("🛡️ ${houseUpdated.coatOfArms.toString()}"));
      elements.add(_listSpacer());
    }

    if (houseUpdated.words.isNotEmpty) {
      elements.add(Text("🪶 ${houseUpdated.words.toString()}"));
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

    if (houseUpdated.founded.isNotEmpty) {
      elements.add(Text("📜 Founded: ${houseUpdated.founded.toString()}"));
      elements.add(_listSpacer());
    }

    if (houseUpdated.diedOut.isNotEmpty) {
      elements.add(Text("💀 Died out: ${houseUpdated.diedOut.toString()}"));
      elements.add(_listSpacer());
    }

    if (houseUpdated.titles.length > 1) {
      elements.add(const Text("🎖️ Titles:"));
      for (var title in houseUpdated.titles) {
        elements.add(Text(title));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.seats.length > 1) {
      elements.add(const Text("🏰 Seats:"));
      for (var seat in houseUpdated.seats) {
        elements.add(Text(seat));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.ancestralWeapons.length > 1) {
      elements.add(const Text("Ancestral Weapons:"));
      for (var weapon in houseUpdated.ancestralWeapons) {
        elements.add(Text("🗡️ ${weapon.toString()}"));
      }
      elements.add(_listSpacer());
    }

    if (houseBasic.cadetBranches.isNotEmpty) {
      elements.add(const Text("🏰 Cadet Branches:"));
      for (int i = 0; i < houseBasic.cadetBranches.length; i++) {
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

    if (houseBasic.swornMembers.isNotEmpty) {
      elements.add(const Text("👱 Members:"));
      for (int i = 0; i < houseBasic.swornMembers.length; i++) {
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
