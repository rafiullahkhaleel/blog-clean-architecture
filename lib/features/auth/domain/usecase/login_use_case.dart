import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

import '../entity/user.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository _authRepository;
  const LoginUseCase(this._authRepository);
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await _authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}
