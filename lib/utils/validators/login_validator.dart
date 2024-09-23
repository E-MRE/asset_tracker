import 'package:asset_tracker/utils/mixins/regexp_pattern_mixin.dart';

final class LoginValidator {
  String? validateEmail(String? value) {
    final email = value ?? '';
    final regex = RegExp(RegexpPatternMixin.emailPattern);

    return email.isEmpty || !regex.hasMatch(email) ? 'Lütfen geçerli bir email adresi giriniz' : null;
  }

  String? validatePassword(String? value) {
    final password = value ?? '';

    if (password.isEmpty) {
      return 'Şifre alanı zorunludur.';
    }

    if (password.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır.';
    }

    return null;
  }
}
