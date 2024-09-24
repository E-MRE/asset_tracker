import 'package:asset_tracker/models/user/user_model.dart';
import 'package:asset_tracker/services/auth/user_notifier_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseUserNotifierManager extends UserNotifierService {
  FirebaseUserNotifierManager() : super() {
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
  }

  @override
  UserModel? get currentUser => _currentUser;
  UserModel? _currentUser;

  void _onAuthStateChanged(User? event) {
    _currentUser = UserModel(email: event?.email ?? '-', name: event?.displayName ?? '-', password: '');
    notifyListeners();
  }
}
