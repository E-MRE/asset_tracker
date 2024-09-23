import 'package:asset_tracker/models/user/user_model.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial implements LoginState {
  const LoginInitial();
}

class LoginLoading implements LoginState {
  const LoginLoading();
}

class LoginSuccess implements LoginState {
  const LoginSuccess({required this.userModel});

  final UserModel userModel;
}

class LoginError implements LoginState {
  const LoginError({this.message = ''});

  final String message;
}
