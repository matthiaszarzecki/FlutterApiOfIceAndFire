import 'package:flutter_application_1/models/house.dart';
import 'package:flutter/material.dart';
import 'single_house_display.dart';

class SingleHouseLoader extends StatefulWidget {
  const SingleHouseLoader({super.key, required this.house});

  final House house;

  @override
  State<SingleHouseLoader> createState() => _SingleHouseLoaderState();
}

class _SingleHouseLoaderState extends State<SingleHouseLoader> {
  @override
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleHouseDisplay(house: widget.house),
    );
  }
}
