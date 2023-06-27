import '../models/all_houses_response.dart';
import 'dart:convert';
import 'package:flutter_application_1/views/single_house_loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllHousesLoader extends StatefulWidget {
  const AllHousesLoader({super.key, required this.title});

  final String title;

  @override
  State<AllHousesLoader> createState() => _AllHousesLoaderState();
}

class _AllHousesLoaderState extends State<AllHousesLoader> {
  var currentPage = 1;
  var pageSize = 50;
  var allHouses = [];

  @override
  void initState() {
    super.initState();
    _loadMoreHouses();
  }

  void _loadMoreHouses() async {
    var url = Uri.parse(
        'https://anapioficeandfire.com/api/houses?page=$currentPage&pageSize=$pageSize');
    final response = await http.get(url);

    setState(
      () {
        if (response.statusCode >= 200 && response.statusCode <= 299) {
          var newHouses =
              AllHousesResponse.fromJson(jsonDecode(response.body)).houses;
          for (var house in newHouses) {
            allHouses.add(house);
          }

          currentPage++;

          // Check if succesful, but no more houses - then stop further pagination, hide spinner
        } else {
          // Error Handling
        }
      },
    );
  }

  ScrollController _paginationController() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          _loadMoreHouses();
        }
      },
    );
    return scrollController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          controller: _paginationController(),
          itemCount: allHouses.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < allHouses.length) {
              var house = allHouses[index];
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: Text(house.name),
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
            } else {
              return const UnconstrainedBox(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      width: 26,
                      height: 26,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(height: 46),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

/*
FutureBuilder<AllHousesResponse>(
future: futureAllHouses,
builder: (context, snapshot) {
  if (snapshot.hasData) {
    final allHouses = snapshot.data!.houses;

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("End of list reached");
      }
    });

    return ListView.builder(
        controller: scrollController,
        itemCount: allHouses.length,
        itemBuilder: (BuildContext context, int index) =>
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: Text(allHouses[index].name),
              onPressed: () {
                // Navigate to route
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text(allHouses[index].name),
                          ),
                          body: SingleHouseLoader(
                              house: allHouses[index]))),
                );
              },
            ));

    //return AllHousesDisplay(allHouses: allHouses);
  } else if (snapshot.hasError) {
    return Text('${snapshot.error}');
  }

  return const CircularProgressIndicator();
},
),

*/