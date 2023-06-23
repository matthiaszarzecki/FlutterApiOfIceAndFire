import 'house.dart';
import 'package:flutter/material.dart';

class HouseView extends StatelessWidget {
  const HouseView({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          house.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(house.region),
        Text("🛡️ ${house.coatOfArms.toString()}"),
        Text("🪶 ${house.words.toString()}"),
      ],
    );
  }
}