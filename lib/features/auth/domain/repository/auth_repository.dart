import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
}
