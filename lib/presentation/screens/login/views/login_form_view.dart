import 'package:asset_tracker/utils/validators/login_validator.dart';
import 'package:flutter/material.dart';

final class LoginFormView extends StatelessWidget {
  const LoginFormView({
    super.key,
    required this.formKey,
    required this.validator,
    required this.onLogin,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final LoginValidator validator;
  final VoidCallback onLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validator.validateEmail(value),
            decoration: const InputDecoration(
              label: Text('E-Posta'),
              hintText: 'E-posta adresinizi giriniz',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLength: 16,
            obscureText: true,
            controller: passwordController,
            validator: (value) => validator.validatePassword(value),
            decoration: const InputDecoration(
              label: Text('Şifre'),
              hintText: 'Şifrenizi giriniz.',
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onLogin,
            child: const Text('Giriş Yap'),
          )
        ],
      ),
    );
  }
}
