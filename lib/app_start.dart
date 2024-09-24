import 'package:asset_tracker/firebase_options.dart';
import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/utils/dependency/app_dependencies.dart';
import 'package:asset_tracker/utils/dependency/dependency_injector.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_storage/flutter_local_storage.dart';

class AppStart {
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await _appCheckInitialize();
    kDependencyService.register(customInjections: _customInjections);
    _registerStorageModels();
  }

  Future<void> _appCheckInitialize() async {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug,
    );
  }

  void _customInjections(DependencyInjector injector) {
    if (!injector.isRegistered<FlutterLocalStorageService>()) {
      injector.registerLazySingleton<FlutterLocalStorageService>(() => HiveStorageManager());
    }
  }

  void _registerStorageModels() {
    kStorage.register<UserModel>((json) => UserModel.fromJson(json));
  }
}
