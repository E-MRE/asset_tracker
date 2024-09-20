abstract class AuthService {
  Future<void> register();
  Future<void> login();
  Future<void> logout();
}
