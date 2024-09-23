import 'package:asset_tracker/models/auth/auth_request_model.dart';
import 'package:asset_tracker/presentation/screens/login/cubit/login_state.dart';
import 'package:asset_tracker/services/auth/auth_service.dart';
import 'package:asset_tracker/services/auth/firebase_auth_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthService? authService})
      : _authService = authService ?? FirebaseAuthManager(),
        super(const LoginInitial());

  final AuthService _authService;

  Future<void> login(String email, String password) async {
    emit(const LoginLoading());

    final request = AuthRequestModel(email: email, password: password);

    final response = await _authService.login(request);

    if (response.isNotSuccessOrDataNotExists) {
      emit(LoginError(message: response.message));
    } else {
      emit(LoginSuccess(userModel: response.data!));
    }
  }
}
