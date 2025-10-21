import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/views/single_house_view/single_house_loader.dart';
import 'package:flutter/material.dart';

class HouseCell extends StatelessWidget {
  const HouseCell({super.key, required this.house});

  final HouseBasic house;

  bool _isGreatHouse() {
    const List<int> listOfGreatHouses = [
      7,
      17,
      169,
      195,
      229,
      285,
      362,
      378,
      395,
      398,
      407,
    ];
    return listOfGreatHouses.contains(house.id());
  }

  Color _colorMain() {
    return _isGreatHouse() ? Colors.grey.shade800 : Colors.red.shade400;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: _colorMain(),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _colorMain().withValues(alpha: 0.5),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
          ),
          child: SizedBox(
            width: width - 16 * 2,
            height: 60,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(house.name),
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                      ),
                      body: SingleHouseLoader(houseBasic: house),
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  const SizedBox(height: 17),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 12,
                        child: Text(
                          house.initial(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        house.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
