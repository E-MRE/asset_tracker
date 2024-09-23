import 'package:asset_tracker/models/user/user_model.dart';
import 'package:flutter/material.dart';

abstract class UserNotifierService extends ChangeNotifier {
  UserModel? get currentUser;
}
