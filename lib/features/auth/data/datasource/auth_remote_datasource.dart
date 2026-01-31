import 'package:blog_clean_architecture/core/error/exception.dart';
import 'package:blog_clean_architecture/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> login({required String email, required String password});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient _supabase;
  AuthRemoteDatasourceImpl(this._supabase);
  @override
  Future<UserModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerException('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
