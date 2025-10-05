import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/auth_models.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/auth/register/')
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST('/auth/login/')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/auth/logout/')
  Future<void> logout(@Body() Map<String, String> refreshToken);

  @POST('/auth/token/refresh/')
  Future<RefreshTokenResponse> refreshToken(@Body() Map<String, String> refreshToken);
}
