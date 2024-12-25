import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_app/core/api_server.dart';
import 'package:planet_app/core/custom_show_snack_bar.dart';
import 'package:planet_app/features/auth/data/repo/auth_repo.dart';
import 'package:planet_app/features/auth/presentation/view/login_view.dart';
import 'package:planet_app/features/auth/presentation/view/register_view.dart';
import 'package:planet_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:planet_app/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:planet_app/features/home/presentation/view/home_view.dart';
import 'package:planet_app/features/home/presentation/view_model.dart/app_cubit/app_cubit.dart';
import 'package:planet_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';
  static const kregisterView = '/registerView';
  static const kHomeView = '/homeView';

  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kregisterView,
      builder: (context, state) => BlocProvider(
        create: (context) => RegisterCubit(getIt.get<AuthRepo>()),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepo>()),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) =>  BlocProvider(
        create: (context) => AppCubit(),
        child:const HomeView(),
      ),
    ),
  ]);
}
