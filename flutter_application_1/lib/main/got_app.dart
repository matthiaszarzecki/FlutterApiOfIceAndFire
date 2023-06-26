import '../views/single_house_loader.dart';
import 'package:flutter/material.dart';

class GOTApp extends StatelessWidget {
  GOTApp({super.key});

  final themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    useMaterial3: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houses of Westeros',
      theme: themeData,
      home: const SingleHouseLoader(title: 'Houses of Westeros'),
    );
  }
}