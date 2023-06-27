import '../models/house.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'single_house_display.dart';

class SingleHouseLoader extends StatefulWidget {
  const SingleHouseLoader({super.key, required this.house});

  final House house;

  @override
  State<SingleHouseLoader> createState() => _SingleHouseLoaderState();
}

class _SingleHouseLoaderState extends State<SingleHouseLoader> {
  late Future<House> futureHouse;

  @override
  void initState() {
    super.initState();
    //futureHouse = loadNewRandomHouse();
  }

  void _loadNewHouse() {
    setState(() {
      futureHouse = loadNewRandomHouse();
    });
  }

  Future<House> loadNewRandomHouse() async {
    const numberOfHouses = 444;
    final randomNumber = Random().nextInt(numberOfHouses);

    final response = await http.get(
        Uri.parse('https://anapioficeandfire.com/api/houses/$randomNumber'));

    if (response.statusCode == 200) {
      return House.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleHouseDisplay(house: widget.house),
    );
  }
}
