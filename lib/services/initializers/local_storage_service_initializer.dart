import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/services/initializers/service_initializer.dart';
import 'package:asset_tracker/utils/dependency/app_dependencies.dart';

final class LocalStorageServiceInitializer extends ServiceInitializer {
  @override
  Future<void> initialize() async {
    kStorage.register<UserModel>((json) => UserModel.fromJson(json));
  }
}
