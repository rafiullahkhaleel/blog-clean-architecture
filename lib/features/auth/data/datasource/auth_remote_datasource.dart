abstract interface class AuthRemoteDatasource {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<String> login({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRemoteDatasource {
  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
