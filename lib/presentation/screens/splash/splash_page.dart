import 'package:asset_tracker/presentation/screens/login/login_page.dart';
import 'package:asset_tracker/presentation/screens/menu/menu_page.dart';
import 'package:asset_tracker/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:asset_tracker/presentation/screens/splash/cubit/splash_state.dart';
import 'package:asset_tracker/utils/dependency/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final String _url = 'https://www.pngitem.com/pimgs/m/193-1939529_asset-management-system-icon-hd-png-download.png';

  late final SplashCubit _cubit;

  @override
  void initState() {
    _cubit = getDependency<SplashCubit>();
    super.initState();
    Future.microtask(() => _cubit.checkUserExists());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => _cubit,
          child: BlocConsumer<SplashCubit, SplashState>(
            listener: _buildListener,
            builder: (context, state) {
              if (state is SplashLoading) {
                return const CircularProgressIndicator();
              }

              return _buildImage();
            },
          ),
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.network(
      _url,
      errorBuilder: (_, __, ___) => const Icon(Icons.assessment_outlined),
    );
  }

  void _navigatePage(Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void _buildListener(BuildContext context, SplashState state) async {
    if (state is SplashUserExistsState) {
      await context.read<SplashCubit>().autoLogin(state.user);
    } else if (state is SplashUserNotExistsState || state is SplashError) {
      _navigatePage(const LoginPage());
    } else if (state is SplashSuccess) {
      _navigatePage(const MenuPage());
    }
  }
}
