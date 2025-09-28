import 'package:dio/dio.dart';
import 'package:lumo_app/core/data/api_client.dart';

import '../../domain/entities/user.dart' as domain;
import '../../domain/repositories/auth_repository_interface.dart';
import '../datasources/auth_api.dart';
import '../models/auth_models.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthApi _authApi;

  AuthRepository() : _authApi = AuthApi(ApiClient.instance);

  @override
  Future<domain.AuthUser> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      final request = RegisterRequest(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        passwordConfirm: passwordConfirm,
      );
      final response = await _authApi.register(request);

      ApiClient.setAuthToken(response.accessToken);

      final user = domain.User(
        id: response.user.id,
        email: response.user.email,
        firstName: response.user.firstName,
        lastName: response.user.lastName,
      );

      final customerProfile = domain.CustomerProfile(
        id: response.customerProfile.id,
        phoneNumber: response.customerProfile.phoneNumber,
        loyaltyPoints: response.customerProfile.loyaltyPoints,
      );
      return domain.AuthUser(
        user: user,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        customerProfile: customerProfile,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        String errorMessage = 'Registration failed';

        if (errorData is Map<String, dynamic>) {
          if (errorData.containsKey('non_field_errors')) {
            errorMessage = errorData['non_field_errors'][0];
          } else if (errorData.containsKey('email')) {
            errorMessage = errorData['email'][0];
          } else if (errorData.containsKey('password')) {
            errorMessage = errorData['password'][0];
          }
        }

        throw Exception(errorMessage);
      } else {
        throw Exception('Registration failed. Please try again.');
      }
    } catch (e) {
      throw Exception('Network error. Please check your connection.');
    }
  }

  @override
  Future<domain.AuthUser> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _authApi.login(request);

      ApiClient.setAuthToken(response.accessToken);

      final user = domain.User(
        id: response.user.id,
        email: response.user.email,
        firstName: response.user.firstName,
        lastName: response.user.lastName,
      );

      final customerProfile = response.customerProfile != null
          ? domain.CustomerProfile(
              id: response.customerProfile!.id,
              phoneNumber: response.customerProfile!.phoneNumber,
              loyaltyPoints: response.customerProfile!.loyaltyPoints,
            )
          : null;

      return domain.AuthUser(
        user: user,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        customerProfile: customerProfile,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('Invalid email or password');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else {
        throw Exception('Login failed. Please try again.');
      }
    } catch (e) {
      throw Exception('Network error. Please check your connection.');
    }
  }

  @override
  Future<void> logout(String refreshToken) async {
    try {
      await _authApi.logout({'refresh_token': refreshToken});
      ApiClient.clearAuthToken();
    } catch (e) {
      ApiClient.clearAuthToken();
    }
  }
}
