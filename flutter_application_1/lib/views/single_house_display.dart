import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay({super.key, required this.houseUpdated});

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
      elements.add(
        const Text(
          "🛡️ Coat of Arms",
          style: TextStyle(fontSize: 20),
        ),
      );
      elements.add(Text(houseUpdated.coatOfArms));
      elements.add(_listSpacer());
    }

    if (houseUpdated.words.isNotEmpty) {
      elements.add(
        const Text(
          "🪶 Motto",
          style: TextStyle(fontSize: 20),
        ),
      );
      elements.add(Text(houseUpdated.words));
      elements.add(_listSpacer());
    }

    if (houseUpdated.currentLord != null) {
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              List<Text> elements = [
                const Text(
                  "👑 Current Lord",
                  style: TextStyle(fontSize: 20),
                ),
                Text(character.name)
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: elements,
              );
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
              List<Text> elements = [
                const Text(
                  "👱 Heir",
                  style: TextStyle(fontSize: 20),
                ),
                Text(character.name)
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: elements,
              );
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
              List<Text> elements = [
                const Text(
                  "👱 Founder",
                  style: TextStyle(fontSize: 20),
                ),
                Text(character.name)
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: elements,
              );
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
              List<Text> elements = [
                const Text(
                  "🏰 Overlord",
                  style: TextStyle(fontSize: 20),
                ),
                Text(houseBasic.name)
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: elements,
              );
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.overlord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.founded.isNotEmpty) {
      elements.add(
        const Text(
          "📜 Founded",
          style: TextStyle(fontSize: 20),
        ),
      );
      elements.add(Text(houseUpdated.founded));
      elements.add(_listSpacer());
    }

    if (houseUpdated.diedOut.isNotEmpty) {
      elements.add(
        const Text(
          "💀 Died out",
          style: TextStyle(fontSize: 20),
        ),
      );
      elements.add(Text(houseUpdated.diedOut));
      elements.add(_listSpacer());
    }

    if (houseUpdated.titles.length > 1) {
      elements.add(
        const Text(
          "🎖️ Titles",
          style: TextStyle(fontSize: 20),
        ),
      );
      for (var title in houseUpdated.titles) {
        elements.add(Text(title));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.seats.length > 1) {
      elements.add(
        const Text(
          "🏰 Seats",
          style: TextStyle(fontSize: 20),
        ),
      );
      for (var seat in houseUpdated.seats) {
        elements.add(Text(seat));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.ancestralWeapons.length > 1) {
      elements.add(
        const Text(
          "🗡️ Ancestral Weapons",
          style: TextStyle(fontSize: 20),
        ),
      );
      for (var weapon in houseUpdated.ancestralWeapons) {
        elements.add(Text(weapon));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.cadetBranches.isNotEmpty) {
      elements.add(
        const Text(
          "🏰 Cadet Branches",
          style: TextStyle(fontSize: 20),
        ),
      );
      for (int i = 0; i < houseUpdated.cadetBranches.length; i++) {
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

    if (houseUpdated.swornMembers.isNotEmpty) {
      elements.add(
        const Text(
          "👱 Members",
          style: TextStyle(fontSize: 20),
        ),
      );
      for (int i = 0; i < houseUpdated.swornMembers.length; i++) {
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(children: elements),
    );
  }
}
