import 'package:blog_clean_architecture/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/usecase/login_use_case.dart';
import '../state/sign_up_state.dart';

final authProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((
  red,
) {
  return SignUpNotifier(sl<SignUpUseCase>(), sl<LoginUseCase>());
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final LoginUseCase _loginUseCase;
  SignUpNotifier(this._signUpUseCase, this._loginUseCase)
    : super(SignUpState());
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null, user: null);
    final result = await _signUpUseCase(
      SignUpParams(name: name, email: email, password: password),
    );
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (user) {
        state = state.copyWith(isLoading: false, user: user);
      },
    );
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null, user: null);
    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (user) {
        state = state.copyWith(isLoading: false, user: user);
      },
    );
  }
}
