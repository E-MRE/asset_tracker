import 'package:asset_tracker/services/initializers/service_initializer.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

final class AppCheckServiceInitializer extends ServiceInitializer {
  @override
  Future<void> initialize() async {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug,
    );
  }
}
