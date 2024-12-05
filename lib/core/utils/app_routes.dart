import 'package:go_router/go_router.dart';
import 'package:planet_app/features/auth/presentation/view/login_view.dart';
import 'package:planet_app/features/auth/presentation/view/register_view.dart';
import 'package:planet_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';
  static const kregisterView = '/registerView';
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kregisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
