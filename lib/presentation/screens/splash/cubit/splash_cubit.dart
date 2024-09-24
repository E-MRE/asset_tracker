import 'package:asset_tracker/models/auth/auth_request_model.dart';
import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/presentation/screens/splash/cubit/splash_state.dart';
import 'package:asset_tracker/utils/dependency/app_dependencies.dart';
import 'package:asset_tracker/utils/enums/app_storage_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  void checkUserExists() {
    final result = kStorage.getValue<UserModel>(AppStorageKeys.user());
    Future.delayed(Duration.zero);

    if (result.isNotSuccessOrDataNotExists) {
      emit(const SplashUserNotExistsState());
    } else {
      emit(SplashUserExistsState(user: result.data!));
    }
  }

  Future<void> autoLogin(UserModel user) async {
    emit(const SplashLoading());
    await Future.delayed(const Duration(seconds: 5));

    final request = AuthRequestModel(email: user.email, password: user.password);
    final response = await kAuthService.login(request);

    if (response.isSuccessAndDataExists) {
      emit(const SplashSuccess());
    } else {
      emit(SplashError(message: response.message));
    }
  }
}
