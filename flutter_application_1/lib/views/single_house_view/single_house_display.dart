import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/all_houses_view/house_cell.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay({super.key, required this.houseUpdated});

  final HouseUpdated houseUpdated;

  Widget _listSpacer() {
    return const SizedBox(height: 10);
  }

  Widget _singleHouseHeader(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _singleHouseTextElement(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text),
    );
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
      elements.add(_singleHouseHeader("🛡️ Coat of Arms"));
      elements.add(_singleHouseTextElement(houseUpdated.coatOfArms));
      elements.add(_listSpacer());
    }

    if (houseUpdated.words.isNotEmpty) {
      elements.add(_singleHouseHeader("🪶 Motto"));
      elements.add(_singleHouseTextElement(houseUpdated.words));
      elements.add(_listSpacer());
    }

    if (houseUpdated.currentLord != null) {
      elements.add(_singleHouseHeader("👑 Current Lord"));
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return _singleHouseTextElement(character.name);
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.currentLord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.heir != null) {
      elements.add(_singleHouseHeader("👱 Heir"));
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return _singleHouseTextElement(character.name);
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.heir,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.founder != null) {
      elements.add(_singleHouseHeader("👱 Founder"));
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Character character = snapshot.data as Character;
              return _singleHouseTextElement(character.name);
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.founder,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.overlord != null) {
      elements.add(_singleHouseHeader("🏰 Overlord"));
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              HouseBasic houseBasic = snapshot.data as HouseBasic;
              return HouseCell(house: houseBasic);
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.overlord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.founded.isNotEmpty) {
      elements.add(_singleHouseHeader("📜 Founded"));
      elements.add(_singleHouseTextElement(houseUpdated.founded));
      elements.add(_listSpacer());
    }

    if (houseUpdated.diedOut.isNotEmpty) {
      elements.add(_singleHouseHeader("💀 Died out"));
      elements.add(_singleHouseTextElement(houseUpdated.diedOut));
      elements.add(_listSpacer());
    }

    if (houseUpdated.titles.isNotEmpty) {
      elements.add(_singleHouseHeader("🎖️ Titles"));
      for (String title in houseUpdated.titles) {
        elements.add(_singleHouseTextElement(title));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.seats.isNotEmpty) {
      elements.add(_singleHouseHeader("🏰 Seats"));
      for (String seat in houseUpdated.seats) {
        elements.add(_singleHouseTextElement(seat));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.ancestralWeapons.length > 1) {
      elements.add(_singleHouseHeader("🗡️ Ancestral Weapons"));
      for (String weapon in houseUpdated.ancestralWeapons) {
        elements.add(_singleHouseTextElement(weapon));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.cadetBranches.isNotEmpty) {
      elements.add(_singleHouseHeader("🏰 Cadet Branches"));
      for (int i = 0; i < houseUpdated.cadetBranches.length; i++) {
        elements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HouseBasic houseBasic = snapshot.data as HouseBasic;
                return HouseCell(house: houseBasic);
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
      elements.add(_singleHouseHeader("👱 Members"));
      for (int i = 0; i < houseUpdated.swornMembers.length; i++) {
        elements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Character character = snapshot.data as Character;
                return _singleHouseTextElement(character.name);
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
