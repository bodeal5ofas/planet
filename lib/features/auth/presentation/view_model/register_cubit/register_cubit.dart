import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:planet_app/core/api_server.dart';
import 'package:planet_app/features/auth/data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitialState());
  AuthRepo authRepo;
  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());

    var result = await authRepo.register(email: email, password: password);
    result.fold(
      (error) {
        emit(RegisterFailureState(errMessage: error.errorMessage));
      },
      (title) {
        emit(RegisterSuccessState());
      },
    );
  }
}
