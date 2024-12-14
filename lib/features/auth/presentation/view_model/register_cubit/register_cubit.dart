import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:planet_app/core/api_server.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.apiServer) : super(RegisterInitialState());
  ApiServer apiServer;
  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      await apiServer.register(email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(RegisterFailureState(errMessage:'The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    emit(RegisterFailureState(errMessage:'The account already exists for that email.'));
  }
} catch (e) {
  emit(RegisterFailureState(errMessage:e.toString()));
}
  }
}
