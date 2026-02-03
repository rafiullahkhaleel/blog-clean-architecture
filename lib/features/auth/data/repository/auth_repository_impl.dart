import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/features/auth/domain/entity/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exception.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  AuthRepositoryImpl(this._authRemoteDatasource);
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async =>
          await _authRemoteDatasource.login(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await _authRemoteDatasource.signUp(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
