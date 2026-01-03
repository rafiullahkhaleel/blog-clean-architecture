class SignUpState {
  final bool isLoading;
  final String? userId;
  final String? error;

  const SignUpState({this.isLoading = false, this.userId, this.error});

  SignUpState copyWith({bool? isLoading, String? userId, String? error}) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      userId: userId,
      error: error,
    );
  }
}
