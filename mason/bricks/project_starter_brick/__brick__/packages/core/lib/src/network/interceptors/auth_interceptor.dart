import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../interfaces/token_storage.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Buraya Refresh Token mantığı eklenebilir (QueuedInterceptor ile)
      // Şimdilik hatayı olduğu gibi iletiyoruz.
    }
    super.onError(err, handler);
  }
}
