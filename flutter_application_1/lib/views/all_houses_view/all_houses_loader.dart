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
  int currentPage = 1;
  List<HouseBasic> allHouses = [];
  AllHousesLoaderState state = AllHousesLoaderState.loadingInitial;

  final int pageSize = 50;

  @override
  void initState() {
    super.initState();
    _loadMoreHouses();
  }

  void _loadMoreHouses() async {
    final List<HouseBasic>? newHouses = await API.getHouses(currentPage);

    setState(
      () {
        if (newHouses != null) {
          if (newHouses.isNotEmpty) {
            state = AllHousesLoaderState.resultsAndLoadingMore;
            for (HouseBasic house in newHouses) {
              allHouses.add(house);
            }
            currentPage++;
          } else {
            state = AllHousesLoaderState.resultsAndNotLoadingMore;
          }
        } else {
          state = AllHousesLoaderState.error;
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
      body: allHousesList(context),
    );
  }

  Widget allHousesList(BuildContext context) {
    switch (state) {
      case AllHousesLoaderState.loadingInitial:
        return const Center(
          child: LoadingSpinner(),
        );
      case AllHousesLoaderState.resultsAndLoadingMore:
        return Center(
          child: ListView.builder(
            controller: _paginationController(),
            itemCount: allHouses.length + 1, // +1 for spinner
            itemBuilder: (BuildContext context, int index) {
              return index < allHouses.length
                  ? HouseCell(house: allHouses[index])
                  : const LoadingSpinner();
            },
          ),
        );
      case AllHousesLoaderState.resultsAndNotLoadingMore:
        return Center(
          child: ListView.builder(
            controller: _paginationController(),
            itemCount: allHouses.length,
            itemBuilder: (BuildContext context, int index) {
              return HouseCell(house: allHouses[index]);
            },
          ),
        );
      case AllHousesLoaderState.error:
        return Center(
          child: Column(
            children: [
              const Text("Oh no, something went wrong!"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                child: const Text("Retry!"),
                onPressed: () {
                  state = AllHousesLoaderState.loadingInitial;
                  _loadMoreHouses();
                },
              ),
            ],
          ),
        );
    }
  }
}
