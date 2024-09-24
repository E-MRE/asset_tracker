import 'package:asset_tracker/services/initializers/app_check_service_initializer.dart';
import 'package:asset_tracker/services/initializers/dependency_service_initializer.dart';
import 'package:asset_tracker/services/initializers/firebase_service_initializer.dart';
import 'package:asset_tracker/services/initializers/local_storage_service_initializer.dart';
import 'package:asset_tracker/services/initializers/service_initializer.dart';

mixin ServiceInitializerRunnerMixin {
  List<ServiceInitializer> get _initializers {
    return [
      FirebaseServiceInitializer(),
      AppCheckServiceInitializer(),
      DependencyServiceInitializer(),
      LocalStorageServiceInitializer(),
    ];
  }

  Future<void> runInitializers() async {
    await Future.forEach(_initializers, (initializer) => initializer.initialize());
  }
}
