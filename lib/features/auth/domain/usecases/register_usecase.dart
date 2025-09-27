import '../entities/user.dart';
import '../repositories/auth_repository_interface.dart';

class RegisterUseCase {
  final AuthRepositoryInterface _authRepository;

  RegisterUseCase(this._authRepository);

  Future<AuthUser> call({
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
  }) async {
    return await _authRepository.register(
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
      passwordConfirm: passwordConfirm,
      phoneNumber: phoneNumber,
    );
  }
}