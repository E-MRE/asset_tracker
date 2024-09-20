import 'package:asset_tracker/app_start.dart';
import 'package:asset_tracker/presentation/screens/harem_gold/harem_gold_page.dart';
import 'package:flutter/material.dart';

void main() async {
  final starter = AppStart();
  await starter.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HaremGoldPage(),
    );
  }
}
