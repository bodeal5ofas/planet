part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}

class LoginSuccessState extends LoginState {}
