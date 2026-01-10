import '../../{{name.snakeCase()}}_core.dart';

/// [AppException] is the base class for all exceptions in the **Data Layer**.
///
/// **Purpose:**
/// These exceptions represent technical errors that occur during data retrieval
/// or manipulation (e.g., parsing JSON, database connection, network failure).
///
/// **Usage:**
/// Throw these exceptions in your RemoteDataSource or LocalDataSource implementation.
/// They will be caught by the Repository and converted into a [Failure] object.
///
/// **Example:**
/// ```dart
/// try {
///    final result = jsonDecode(response.data);
/// } catch (e) {
///    throw JsonFormatException(message: 'Invalid JSON', code: 500);
/// }
/// ```
abstract class AppException implements Exception {
  const AppException({required this.message, this.code});

  final String message;
  final int? code;
}

/// Thrown when the server returns a 500+ error or a known API error response.
class ServerException extends AppException {
  const ServerException({required super.message, super.code});
}

/// Thrown when a local cache operation fails (e.g., Hive read/write error).
class CacheException extends AppException {
  const CacheException({required super.message, super.code});
}

/// Thrown when data parsing fails (e.g. fromJson throws an error).
class JsonFormatException extends AppException {
  const JsonFormatException({required super.message, super.code});
}

/// Thrown when a token refresh operation fails or no token is found.
class AuthTokenException extends AppException {
  const AuthTokenException({required super.message, super.code});
}
