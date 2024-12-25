import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:planet_app/core/api_server.dart';
import 'package:planet_app/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitialState());
  AuthRepo authRepo;
  login({required String email, required String password}) async {
    emit(LoginLoadingState());

    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (error) {
        emit(LoginFailureState(errMessage: error.errorMessage));
      },
      (title) {
        emit(LoginSuccessState());
      },
    );
  }
}
