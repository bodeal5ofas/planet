import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:planet_app/core/api_server.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiServer) : super(LoginInitialState());
  ApiServer apiServer;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await apiServer.login(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errMessage:'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(errMessage:'Wrong password provided for that user.'));
      }
    }
  }
}
