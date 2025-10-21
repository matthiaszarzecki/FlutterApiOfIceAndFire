import 'dart:math';

import 'package:flutter_application_1/helper/api.dart';
import 'package:flutter_application_1/models/house_basic.dart';
import 'package:flutter_application_1/views/all_houses_view/house_cell.dart';
import 'package:flutter_application_1/views/modular_views/loading_spinner.dart';
import 'package:flutter/material.dart';

class AllHousesLoader extends StatefulWidget {
  const AllHousesLoader({super.key, required this.title});

  final String title;

  @override
  State<AllHousesLoader> createState() => _AllHousesLoaderState();
}

enum AllHousesLoaderState {
  loadingInitial,
  resultsAndLoadingMore,
  resultsAndNotLoadingMore,
  error
}

class _AllHousesLoaderState extends State<AllHousesLoader> {
  int _currentPage = 1;
  final List<HouseBasic> _allHouses = [];
  AllHousesLoaderState _state = AllHousesLoaderState.loadingInitial;
  final API _api = API.instance;

  @override
  void initState() {
    super.initState();
    _loadMoreHouses();
  }

  void _loadMoreHouses() async {
    final List<HouseBasic>? newHouses = await _api.getHouses(
      _currentPage,
    );

    setState(() {
      if (newHouses != null) {
        if (newHouses.isNotEmpty) {
          _state = AllHousesLoaderState.resultsAndLoadingMore;
          for (HouseBasic house in newHouses) {
            _allHouses.add(house);
          }
          _currentPage++;
        } else {
          _state = AllHousesLoaderState.resultsAndNotLoadingMore;
        }
      } else {
        _state = AllHousesLoaderState.error;
      }
    });
  }

  ScrollController _paginationController() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _loadMoreHouses();
      }
    });
    return scrollController;
  }

  // TODO: Extract this, simplify
  Color _randomRedColor() {
    Color baseColor = Colors.red.shade400;
    final int randomRange = 60;
    final int halfRandomRange = (randomRange / 2).round();

    final newR = ((baseColor.r * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);
    final newG = ((baseColor.g * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);
    final newB = ((baseColor.b * 255).round() +
            Random().nextInt(randomRange) -
            halfRandomRange)
        .clamp(0, 255);

    Color newColor = Color.fromARGB(
      255,
      newR,
      newG,
      newB,
    );
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: allHousesList(context),
    );
  }

  Widget allHousesList(BuildContext context) {
    switch (_state) {
      case AllHousesLoaderState.loadingInitial:
        return const Center(
          child: LoadingSpinner(),
        );
      case AllHousesLoaderState.resultsAndLoadingMore:
        return Center(
          child: ListView.builder(
            controller: _paginationController(),
            itemCount: _allHouses.length + 1, // +1 for spinner
            itemBuilder: (BuildContext context, int index) {
              return index < _allHouses.length
                  ? HouseCell(house: _allHouses[index], color: _randomRedColor())
                  : const LoadingSpinner();
            },
          ),
        );
      case AllHousesLoaderState.resultsAndNotLoadingMore:
        return Center(
          child: ListView.builder(
            controller: _paginationController(),
            itemCount: _allHouses.length,
            itemBuilder: (BuildContext context, int index) {
              return HouseCell(house: _allHouses[index], color: _randomRedColor());
            },
          ),
        );
      case AllHousesLoaderState.error:
        return Center(
          child: Column(
            children: [
              const Text('Oh no, something went wrong!'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: const Text('Retry!'),
                onPressed: () {
                  _state = AllHousesLoaderState.loadingInitial;
                  _loadMoreHouses();
                },
              ),
            ],
          ),
        );
    }
  }
}
