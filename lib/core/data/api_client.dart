import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lumo_app/core/utils/app_logger.dart';
import 'package:lumo_app/core/services/auth_service.dart';

class ApiClient {
  static late Dio _dio;
  static const String _baseUrl = 'http://localhost:8000/api/v1';
  static bool _isRefreshing = false;
  static final List<RequestOptions> _requestsQueue = [];

  static void initialize() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? _baseUrl;

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_isRefreshing) {
            _requestsQueue.add(options);
            return;
          }
          handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final isAuthEndpoint =
                error.requestOptions.path.contains('/auth/login') ||
                error.requestOptions.path.contains('/auth/register') ||
                error.requestOptions.path.contains('/auth/token/refresh');

            if (isAuthEndpoint) {
              handler.next(error);
              return;
            }

            if (!_isRefreshing) {
              _isRefreshing = true;

              try {
                final refreshSuccess = await AuthService.refreshAccessToken();

                if (refreshSuccess) {
                  final options = error.requestOptions;
                  final accessToken = await AuthService.getAccessToken();
                  if (accessToken != null) {
                    options.headers['Authorization'] = 'Bearer $accessToken';
                  }

                  for (var queuedRequest in _requestsQueue) {
                    if (accessToken != null) {
                      queuedRequest.headers['Authorization'] =
                          'Bearer $accessToken';
                    }
                    _dio.fetch(queuedRequest);
                  }
                  _requestsQueue.clear();

                  _isRefreshing = false;

                  final response = await _dio.fetch(options);
                  handler.resolve(response);
                  return;
                } else {
                  _requestsQueue.clear();
                  _isRefreshing = false;
                  handler.next(error);
                  return;
                }
              } catch (e) {
                _requestsQueue.clear();
                _isRefreshing = false;
                handler.next(error);
                return;
              }
            }
          }

          handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: AppLogger.logPrint,
      ),
    );
  }

  static Dio get instance => _dio;

  static void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
