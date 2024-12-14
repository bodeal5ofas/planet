import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planet_app/core/custom_show_snack_bar.dart';
import 'package:planet_app/core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupCustom();
  runApp(const PlanetApp());
}

class PlanetApp extends StatelessWidget {
  const PlanetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          //  scaffoldBackgroundColor: Colors.greenAccent.withOpacity(0.2),
          primaryColor: Colors.greenAccent.withOpacity(0.5),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500))),
    );
  }
}
