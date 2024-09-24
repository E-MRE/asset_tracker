import 'package:asset_tracker/firebase_options.dart';
import 'package:asset_tracker/services/initializers/service_initializer.dart';
import 'package:firebase_core/firebase_core.dart';

final class FirebaseServiceInitializer extends ServiceInitializer {
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
