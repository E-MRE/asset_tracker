import 'package:asset_tracker/presentation/screens/login/login_page.dart';
import 'package:asset_tracker/presentation/screens/menu/menu_page.dart';
import 'package:asset_tracker/services/auth/user_notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final String _url = 'https://www.vhv.rs/dpng/d/609-6097418_thumb-image-asset-management-system-icon-hd-png.png';

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _checkAutoLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          _url,
          errorBuilder: (_, __, ___) => const Icon(Icons.assessment_outlined),
        ),
      ),
    );
  }

  void _checkAutoLogin() {
    if (!mounted) return;

    final isUserExists = context.read<UserNotifierService>().currentUser != null;
    _navigatePage(isUserExists ? const MenuPage() : const LoginPage());
  }

  void _navigatePage(Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
