import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCase implements UseCase<String, SignUpParams> {
  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);
  @override
  Future<Either<Failure, String>> call(SignUpParams params)async {
    return await _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
