import 'package:blog_clean_architecture/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../state/sign_up_state.dart';

final signUpProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((
  red,
) {
  final signUpUseCase = SignUpUseCase(
    AuthRepositoryImpl(AuthRemoteDatasourceImpl(Supabase.instance.client)),
  );
  return SignUpNotifier(signUpUseCase);
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpNotifier(this._signUpUseCase) : super(SignUpState());
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _signUpUseCase(
      SignUpParams(name: name, email: email, password: password),
    );
    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (userId) {
        state = state.copyWith(isLoading: false, userId: userId);
      },
    );
  }
}
