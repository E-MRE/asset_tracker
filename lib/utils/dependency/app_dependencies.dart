import 'package:asset_tracker/services/auth/auth_service.dart';
import 'package:flutter_local_storage/flutter_local_storage.dart';

import 'dependency_injection_service.dart';
import 'get_it_dependency_injection_manager.dart';

DependencyInjectionService get kDependencyService => GetItDependencyInjectionManager.instance;
FlutterLocalStorageService get kStorage => kDependencyService.injector.get<FlutterLocalStorageService>();
AuthService get kAuthService => kDependencyService.injector.get<AuthService>();

T getDependency<T extends Object>() => kDependencyService.injector.get<T>();
