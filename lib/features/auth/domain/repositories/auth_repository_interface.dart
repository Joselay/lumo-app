import '../entities/user.dart';

abstract class AuthRepositoryInterface {
  Future<AuthUser> register({
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
  });
  Future<AuthUser> login(String email, String password);
  Future<void> logout(String refreshToken);
}