import 'package:asset_tracker/models/auth/auth_request_model.dart';
import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/services/auth/auth_service.dart';
import 'package:asset_tracker/services/results/data_result.dart';
import 'package:asset_tracker/services/results/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthManager extends AuthService {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  Stream<UserModel?> get authStateChanges {
    return _auth.authStateChanges().asyncMap<UserModel?>(
          (data) async => UserModel(email: data?.email ?? '-', name: data?.displayName ?? '-'),
        );
  }

  @override
  Future<DataResult<UserModel>> login(AuthRequestModel request) async {
    return _authOperation(
      () => _auth.signInWithEmailAndPassword(email: request.email, password: request.password),
    );
  }

  @override
  Future<Result> logout() async {
    await _auth.signOut();

    return Result(isSuccess: _auth.currentUser == null);
  }

  @override
  Future<DataResult<UserModel>> register(AuthRequestModel request) async {
    return _authOperation(
      () => _auth.createUserWithEmailAndPassword(email: request.email, password: request.password),
    );
  }

  Future<DataResult<UserModel>> _authOperation(Future<UserCredential> Function() operation) async {
    try {
      final response = await operation.call();
      return DataResult.success(
        data: UserModel(
          email: response.user?.email ?? '-',
          name: response.user?.displayName ?? '-',
        ),
      );
    } on FirebaseAuthException catch (exception) {
      return DataResult.error(message: '${exception.code}: ${exception.message ?? '-'}');
    } catch (exception) {
      return DataResult.error(message: exception.toString());
    }
  }
}
