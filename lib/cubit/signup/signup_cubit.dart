import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:only_gainz/repositories/auth/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRespository;

  SignupCubit({required AuthRepository authRepository})
      : _authRespository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  void signupWithCredentials() async {
    if (!state.isValid) return;
    try {
      await _authRespository.signUp(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }
}
