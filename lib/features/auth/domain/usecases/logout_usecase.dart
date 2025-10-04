import '../../data/repositories/auth_repository.dart';
import '../../../../core/services/auth_service.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<void> call() async {
    final refreshToken = await AuthService.getRefreshToken();

    if (refreshToken != null) {
      await _repository.logout(refreshToken);
    } else {
      await AuthService.clearAuthData();
    }
  }
}
