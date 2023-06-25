import 'house.dart';
import 'package:flutter/material.dart';

class SingleHouseDisplay extends StatelessWidget {
  const SingleHouseDisplay({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    elements.add(Text(
      house.name,
      style: Theme.of(context).textTheme.headlineSmall,
    ));
    elements.add(const SizedBox(height: 10));

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

    if (house.currentLord.isNotEmpty) {
      elements.add(Text("Current Lord: ${house.currentLord.toString()}"));
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

    return Column(children: elements);
  }
}
