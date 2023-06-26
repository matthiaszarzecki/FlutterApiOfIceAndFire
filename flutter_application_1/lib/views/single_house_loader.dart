import 'dart:convert';
import 'dart:math';
import 'house_view.dart';
import 'house.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleHouseView extends StatefulWidget {
  const SingleHouseView({super.key, required this.title});

  final String title;

  @override
  State<SingleHouseView> createState() => _SingleHouseViewState();
}

class _SingleHouseViewState extends State<SingleHouseView> {
  late Future<House> futureHouse;

  @override
  void initState() {
    super.initState();
    futureHouse = fetchAlbum();
  }

  void _loadNewHouse() {
    setState(() {
      futureHouse = fetchAlbum();
    });
  }

  Future<House> fetchAlbum() async {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<House>(
          future: futureHouse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final house = snapshot.data!;
              return SingleHouseDisplay(house: house);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadNewHouse,
        tooltip: 'Refresh',
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}