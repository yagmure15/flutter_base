import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/interceptors/auth_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    @Named('baseUrl') String baseUrl,
    AuthInterceptor authInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Interceptor Sıralaması Önemlidir:
    dio.interceptors.addAll([
      authInterceptor,
      // PrettyDioLogger(), // 3. Logla (Sadece debug modda ekle - paket dependency eklenirse açılır)
    ]);

    return dio;
  }
}
