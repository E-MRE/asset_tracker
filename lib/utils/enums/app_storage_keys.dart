import 'package:flutter_local_storage/flutter_local_storage.dart';

class AppStorageKeys implements StorageKeys {
  AppStorageKeys._(this.key);

  AppStorageKeys.user() : this._('user');

  @override
  final String key;
}
