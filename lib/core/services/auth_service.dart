import 'package:shared_preferences/shared_preferences.dart';
import '../data/api_client.dart';

class AuthService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';

  static Future<void> saveAuthTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);

    ApiClient.setAuthToken(accessToken);
  }

  static Future<void> saveUserInfo({
    required int userId,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, userId);
    await prefs.setString(_userEmailKey, email);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  static Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userEmailKey);

    ApiClient.clearAuthToken();
  }

  static Future<Map<String, dynamic>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(_userIdKey);
    final email = prefs.getString(_userEmailKey);

    if (userId != null && email != null) {
      return {'userId': userId, 'email': email};
    }
    return null;
  }
}
