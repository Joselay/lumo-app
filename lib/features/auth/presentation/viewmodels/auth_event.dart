import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authenticationStarted() = AuthenticationStarted;

  const factory AuthEvent.loginButtonPressed({
    required String email,
    required String password,
  }) = LoginButtonPressed;

  const factory AuthEvent.registerButtonPressed({
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
  }) = RegisterButtonPressed;

  const factory AuthEvent.logoutButtonPressed({
    required String refreshToken,
  }) = LogoutButtonPressed;
}
