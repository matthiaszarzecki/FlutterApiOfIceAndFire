import 'package:flutter_application_1/models/house.dart';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';

class HouseCell extends StatelessWidget {
  const HouseCell({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            child: Text(house.initial()),
          ),
          const SizedBox(width: 10),
          Text(house.name),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(house.name),
              ),
              body: SingleHouseLoader(house: house),
            ),
          ),
        );
      },
    );
  }
}
