import 'package:asset_tracker/services/initializers/service_initializer.dart';
import 'package:asset_tracker/utils/dependency/app_dependencies.dart';
import 'package:asset_tracker/utils/dependency/dependency_injector.dart';
import 'package:flutter_local_storage/flutter_local_storage.dart';

final class DependencyServiceInitializer extends ServiceInitializer {
  @override
  Future<void> initialize() async {
    kDependencyService.register(customInjections: _customInjections);
  }

  void _customInjections(DependencyInjector injector) {
    if (!injector.isRegistered<FlutterLocalStorageService>()) {
      injector.registerLazySingleton<FlutterLocalStorageService>(() => HiveStorageManager());
    }
  }
}
