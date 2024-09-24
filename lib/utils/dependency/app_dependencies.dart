import 'package:flutter_local_storage/flutter_local_storage.dart';

import 'dependency_injection_service.dart';
import 'get_it_dependency_injection_manager.dart';

DependencyInjectionService get kDependencyService => GetItDependencyInjectionManager.instance;
FlutterLocalStorageService get kStorage => kDependencyService.injector.get<FlutterLocalStorageService>();
