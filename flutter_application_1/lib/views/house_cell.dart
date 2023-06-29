import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';

class HouseCell extends StatelessWidget {
  const HouseCell({super.key, required this.house});

  final HouseBasic house;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 40 + 10 * 2;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          const SizedBox(height: 10),
          InkWell(
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
            child: Stack(
              children: [
                Ink(height: 40, width: width, color: Colors.grey),
                Column(
                  children: [
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          child: Text(house.initial()),
                        ),
                        const SizedBox(width: 10),
                        Text(house.name),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
