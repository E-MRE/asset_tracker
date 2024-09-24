import 'dependency_injector.dart';

typedef RegisterDependenciesFunction = void Function(DependencyInjector injector);

abstract class DependencyInjectionService {
  final DependencyInjector injector;

  DependencyInjectionService({required this.injector});

  void register({RegisterDependenciesFunction? customInjections});
}
