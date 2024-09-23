import 'package:asset_tracker/presentation/screens/login/cubit/login_cubit.dart';
import 'package:asset_tracker/presentation/screens/login/cubit/login_state.dart';
import 'package:asset_tracker/presentation/screens/login/views/login_form_view.dart';
import 'package:asset_tracker/utils/alert_dialog/display_alert_dialog.dart';
import 'package:asset_tracker/utils/validators/login_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final LoginValidator _validator;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

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
          child: BlocProvider(
            create: (_) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: _buildListener,
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return LoginFormView(
                  formKey: _formKey,
                  validator: _validator,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onLogin: () => _onLogin(context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      await context.read<LoginCubit>().login(_emailController.text, _passwordController.text);
    }
  }

  void _buildListener(BuildContext context, LoginState state) {
    if (state is LoginError) {
      DisplayAlertDialog(context).errorAlert(state.message);
    } else if (state is LoginSuccess) {
      //TODO: change page
    }
  }
}
