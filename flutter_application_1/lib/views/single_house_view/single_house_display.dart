import 'dart:math';

import 'package:flutter_application_1/models/character.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/models/house_updated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/all_houses_view/house_cell.dart';
import 'package:flutter_application_1/views/all_houses_view/character_cell.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay({super.key, required this.houseUpdated});

  final HouseUpdated houseUpdated;

  Widget _listSpacer() {
    return const SizedBox(height: 24);
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
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _singleHouseCharacterNameElement(String text, double width) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            //color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),
            border: BoxBorder.all(),
          ),
          child: SizedBox(
            width: width - 16 * 2,
            height: 36,
            child: InkWell(
                child: Row(
              children: [
                const SizedBox(width: 6),
                Text(
                  text,
                ),
              ],
            )),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );

    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 6.0,
        right: 16,
        bottom: 6.0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    elements.add(
      SizedBox(
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.red.shade400,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );

    if (houseUpdated.region.isNotEmpty) {
      elements.add(_listSpacer());
      elements.add(
        Text(
          'of ${houseUpdated.region.toString()}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.coatOfArms.isNotEmpty) {
      elements.add(_singleHouseHeader('🛡️ Coat of Arms'));
      elements.add(_singleHouseTextElement(houseUpdated.coatOfArms));
      elements.add(_listSpacer());
    }

    if (houseUpdated.words.isNotEmpty) {
      elements.add(_singleHouseHeader('🪶 Motto'));
      elements.add(_singleHouseTextElement(houseUpdated.words));
      elements.add(_listSpacer());
    }

    if (houseUpdated.currentLord != null) {
      elements.add(_singleHouseHeader('👑 Current Lord'));
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
      elements.add(_singleHouseHeader('👱 Heir'));
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
      elements.add(_singleHouseHeader('👱 Founder'));
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
      elements.add(_singleHouseHeader('🏰 Overlord'));
      elements.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              HouseBasic houseBasic = snapshot.data as HouseBasic;
              // TODO: Pass actual color here
              return HouseCell(house: houseBasic, color: _randomRedColor());
            }
            return const SizedBox(height: 0);
          },
          future: houseUpdated.overlord,
        ),
      );
      elements.add(_listSpacer());
    }

    if (houseUpdated.founded.isNotEmpty) {
      elements.add(_singleHouseHeader('📜 Founded'));
      elements.add(_singleHouseTextElement(houseUpdated.founded));
      elements.add(_listSpacer());
    }

    if (houseUpdated.diedOut.isNotEmpty) {
      elements.add(_singleHouseHeader('💀 Died out'));
      elements.add(_singleHouseTextElement(houseUpdated.diedOut));
      elements.add(_listSpacer());
    }

    if (houseUpdated.titles.isNotEmpty) {
      elements.add(_singleHouseHeader('🎖️ Titles'));
      for (String title in houseUpdated.titles) {
        elements.add(_singleHouseTextElement(title));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.seats.isNotEmpty) {
      elements.add(_singleHouseHeader('🏰 Seats'));
      for (String seat in houseUpdated.seats) {
        elements.add(_singleHouseTextElement(seat));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.ancestralWeapons.length > 1) {
      elements.add(_singleHouseHeader('🗡️ Ancestral Weapons'));
      for (String weapon in houseUpdated.ancestralWeapons) {
        elements.add(_singleHouseTextElement(weapon));
      }
      elements.add(_listSpacer());
    }

    if (houseUpdated.cadetBranches.isNotEmpty) {
      elements.add(_singleHouseHeader('🏰 Cadet Branches'));
      for (int i = 0; i < houseUpdated.cadetBranches.length; i++) {
        elements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HouseBasic houseBasic = snapshot.data as HouseBasic;
                // TODO: Pass actual color here
                return HouseCell(house: houseBasic, color: _randomRedColor());
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
      elements.add(_singleHouseHeader('👱 Members'));
      List<Widget> membersElements = [];

      // Get Data for each character
      for (int i = 0; i < houseUpdated.swornMembers.length; i++) {
        //Character character = houseUpdated.swornMembers[i];

        membersElements.add(
          FutureBuilder(
            builder: (context, snapshot) {
              // Data exists, parse to Characters
              if (snapshot.hasData) {
                Character character = snapshot.data as Character;

                // Very rarely a character has an empty string for a name
                String characterName =
                    character.name != '' ? character.name : 'Unknown';

                if (character.hasInformation()) {
                  return CharacterCell(character: character);
                } else {
                  return _singleHouseCharacterNameElement(
                    characterName,
                    MediaQuery.of(context).size.width,
                  );
                }
              }

              // No Data exists, return an empty view
              return const SizedBox(height: 0);
            },
            future: houseUpdated.swornMembers[i],
          ),
        );
      }
      elements.addAll(membersElements);
    }

    return ListView(children: elements);
  }

  // TODO: Extract this, simplify
  Color _randomRedColor() {
    Color baseColor = Colors.red.shade400;
    final int randomRange = 60;
    final int halfRandomRange = (randomRange / 2).round();

    final newR = ((baseColor.r * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);
    final newG = ((baseColor.g * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);
    final newB = ((baseColor.b * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);

    Color newColor = Color.fromARGB(
      255,
      newR,
      newG,
      newB,
    );
    return newColor;
  }
}
