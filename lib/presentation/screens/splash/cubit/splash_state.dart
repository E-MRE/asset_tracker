import 'package:asset_tracker/models/user/user_model.dart';

abstract class SplashState {
  const SplashState();
}

class SplashInitial implements SplashState {
  const SplashInitial();
}

class SplashUserExistsState implements SplashState {
  const SplashUserExistsState({required this.user});

  final UserModel user;
}

class SplashUserNotExistsState implements SplashState {
  const SplashUserNotExistsState();
}

class SplashLoading implements SplashState {
  const SplashLoading();
}

class SplashSuccess implements SplashState {
  const SplashSuccess();
}

class SplashError implements SplashState {
  final String message;
  const SplashError({this.message = ''});
}
