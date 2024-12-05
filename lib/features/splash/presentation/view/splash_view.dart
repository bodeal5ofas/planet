import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_app/core/utils/app_routes.dart';
import 'package:planet_app/core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        GoRouter.of(context).push(AppRoutes.kLoginView);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsData.klogoImage,
        ),
      ),
    );
  }
}
