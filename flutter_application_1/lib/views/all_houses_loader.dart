import 'package:flutter_application_1/views/single_house_loader.dart';
import '../models/house.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllHousesLoader extends StatefulWidget {
  const AllHousesLoader({super.key, required this.title});

  final String title;

  @override
  State<AllHousesLoader> createState() => _AllHousesLoaderState();
}

class AllHousesResponse {
  final List<House> houses;

  AllHousesResponse({required this.houses});

  factory AllHousesResponse.fromJson(List<dynamic> json) {
    List<House> houses = [];
    for (var house in json) {
      houses.add(House.fromJson(house));
    }
    return AllHousesResponse(houses: houses);
  }
}

class _AllHousesLoaderState extends State<AllHousesLoader> {
  late Future<AllHousesResponse> futureAllHouses;

  @override
  void initState() {
    super.initState();
    futureAllHouses = loadAllHouses();
  }

  void _loadAllHouses() {
    setState(() {
      futureAllHouses = loadAllHouses();
    });
  }

  Future<AllHousesResponse> loadAllHouses() async {
    final response = await http.get(Uri.parse(
        'https://anapioficeandfire.com/api/houses?page=1&pageSize=50'));

    if (response.statusCode == 200) {
      return AllHousesResponse.fromJson(jsonDecode(response.body));
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
        child: FutureBuilder<AllHousesResponse>(
          future: futureAllHouses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final allHouses = snapshot.data!.houses;
              List<Widget> elements = [];

              for (var house in allHouses) {
                elements.add(
                  ElevatedButton(
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

              return ListView(children: elements);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadAllHouses,
        tooltip: 'Refresh',
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
