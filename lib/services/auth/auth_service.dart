import 'package:asset_tracker/models/auth/auth_request_model.dart';
import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/services/results/data_result.dart';
import 'package:asset_tracker/services/results/result.dart';

abstract class AuthService {
  Future<DataResult<UserModel>> register(AuthRequestModel request);
  Future<DataResult<UserModel>> login(AuthRequestModel request);
  Future<Result> logout();
}
