import 'package:asset_tracker/models/auth/auth_request_model.dart';
import 'package:asset_tracker/services/results/result.dart';

abstract class AuthService {
  Future<Result> register(AuthRequestModel request);
  Future<void> login();
  Future<void> logout();
}
