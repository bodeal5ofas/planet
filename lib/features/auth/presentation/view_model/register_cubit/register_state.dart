part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String errMessage;

  RegisterFailureState({required this.errMessage});
}

class RegisterSuccessState extends RegisterState {}
