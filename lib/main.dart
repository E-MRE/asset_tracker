import 'package:asset_tracker/app_start.dart';
import 'package:asset_tracker/presentation/screens/splash/splash_page.dart';
import 'package:asset_tracker/services/auth/firebase_user_notifier_manager.dart';
import 'package:asset_tracker/services/auth/user_notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(
        providers: [ChangeNotifierProvider<UserNotifierService>(create: (_) => FirebaseUserNotifierManager())],
        child: const SplashPage(),
      ),
    );
  }
}
