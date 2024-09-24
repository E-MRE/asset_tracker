import 'dependency_injection_service.dart';
import 'get_it_dependency_injector.dart';

class GetItDependencyInjectionManager extends DependencyInjectionService {
  static GetItDependencyInjectionManager? _instance;
  static GetItDependencyInjectionManager get instance {
    _instance ??= GetItDependencyInjectionManager._private();
    return _instance!;
  }

  GetItDependencyInjectionManager._private() : super(injector: GetItDependencyInjector());

  @override
  void register({RegisterDependenciesFunction? customInjections}) {
    customInjections?.call(injector);
  }
}
