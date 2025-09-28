import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
  }) = _User;
}

@freezed
abstract class CustomerProfile with _$CustomerProfile {
  const factory CustomerProfile({
    required String id,
    required String phoneNumber,
    required int loyaltyPoints,
  }) = _CustomerProfile;
}

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required User user,
    required String accessToken,
    required String refreshToken,
    CustomerProfile? customerProfile,
  }) = _AuthUser;
}
