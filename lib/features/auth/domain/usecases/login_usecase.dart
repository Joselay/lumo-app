import '../entities/user.dart';
import '../repositories/auth_repository_interface.dart';

class LoginUseCase {
  final AuthRepositoryInterface _repository;

  LoginUseCase(this._repository);

  Future<AuthUser> call(String email, String password) async {
    if (email.isEmpty) {
      throw Exception('Email is required');
    }

    if (password.isEmpty) {
      throw Exception('Password is required');
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      throw Exception('Please enter a valid email');
    }

    return await _repository.login(email, password);
  }
}