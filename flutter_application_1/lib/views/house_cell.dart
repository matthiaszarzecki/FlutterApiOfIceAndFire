import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';

class HouseCell extends StatelessWidget {
  const HouseCell({super.key, required this.house});

  final HouseBasic house;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: width,
            height: 60,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(house.name),
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
