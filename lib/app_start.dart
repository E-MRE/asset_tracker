import 'package:flutter/material.dart';
import 'package:asset_tracker/utils/mixins/service_initializer_runner_mixin.dart';

final class AppStart with ServiceInitializerRunnerMixin {
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runInitializers();
  }
}
