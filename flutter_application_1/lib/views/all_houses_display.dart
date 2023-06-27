import 'package:flutter_application_1/models/house.dart';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';

class AllHousesDisplay extends StatelessWidget {
  const AllHousesDisplay({super.key, required this.allHouses});

  final List<House> allHouses;

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];

    for (House house in allHouses) {
      elements.add(
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          child: Text(house.name),
          onPressed: () {
            // Navigate to route
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(house.name),
                      ),
                      body: SingleHouseLoader(house: house))),
            );
          },
        ),
      );
    }

    elements.add(const CircularProgressIndicator());

    return ListView(children: elements);
  }
}
