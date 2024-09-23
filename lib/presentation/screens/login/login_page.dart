import 'package:asset_tracker/utils/validators/login_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final LoginValidator _validator;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _validator = LoginValidator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Giriş Yap')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => _validator.validateEmail(value),
                  decoration: const InputDecoration(
                    label: Text('E-Posta'),
                    hintText: 'E-posta adresinizi giriniz',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  maxLength: 16,
                  validator: (value) => _validator.validatePassword(value),
                  decoration: const InputDecoration(
                    label: Text('Şifre'),
                    hintText: 'Şifrenizi giriniz.',
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: const Text('Giriş Yap'),
                  onPressed: () async => await _onLogin(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
    }
  }
}
