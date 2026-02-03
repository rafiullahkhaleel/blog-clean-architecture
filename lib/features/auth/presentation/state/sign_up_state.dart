import 'package:blog_clean_architecture/features/auth/domain/entity/user.dart';

class SignUpState {
  final bool isLoading;
  final User? user;
  final String? error;

  const SignUpState({this.isLoading = false, this.user, this.error});

  SignUpState copyWith({bool? isLoading, User? user, String? error}) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      user: user,
      error: error,
    );
  }
}
