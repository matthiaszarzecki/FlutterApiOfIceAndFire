import 'package:flutter/material.dart';
import 'single_house_view.dart';

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
      home: const SingleHouseView(title: 'Houses of Westeros'),
    );
  }
}