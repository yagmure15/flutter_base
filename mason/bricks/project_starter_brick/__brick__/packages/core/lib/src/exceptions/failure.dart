import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// [Failure] is the single error type that flows through the **Domain & UI
/// layers**.
///
/// **Flow:**
/// 1. Data sources simply throw (Dio errors, `AppException`s, parsing errors).
/// 2. Repositories wrap calls with `Result.guard(...)`, which converts anything
///    thrown into a [Failure] via `failureFromException`, and return `Result<T>`.
/// 3. The UI switches on the failure to decide what to do. For user-facing text
///    use the app-level `failure.localizedMessage` extension.
///
/// Union cases are public, so they can be pattern matched from any library:
/// ```dart
/// switch (failure) {
///   case UnauthorizedFailure():
///     router.replaceAll([const LoginRoute()]);
///   case ValidationFailure(:final errors):
///     showInputErrors(errors);
///   case Failure(:final message):
///     showSnackBar(message);
/// }
/// ```
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// 5xx responses or an API error payload; [code] is the HTTP status if known.
  const factory Failure.server(String message, [int? code]) = ServerFailure;

  /// No connectivity, DNS or timeout problems.
  const factory Failure.network(String message) = NetworkFailure;

  /// 401 - the session is missing or expired.
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;

  /// 403 - authenticated but not allowed.
  const factory Failure.forbidden(String message) = ForbiddenFailure;

  /// 404 - the resource does not exist.
  const factory Failure.notFound(String message) = NotFoundFailure;

  /// 400/422 - [errors] carries field-level messages from the backend, if any.
  const factory Failure.validation(
    String message, [
    Map<String, dynamic>? errors,
  ]) = ValidationFailure;

  /// Local storage / cache problems.
  const factory Failure.cache(String message, [int? code]) = CacheFailure;

  /// The request was canceled (e.g. through a `CancelToken`); usually safe to
  /// ignore in the UI.
  const factory Failure.canceled([
    @Default('Request was canceled') String message,
  ]) = CanceledFailure;

  /// Anything that could not be classified; [error] keeps the original object
  /// for logging / crash reporting.
  const factory Failure.unknown(String message, [Object? error]) =
      UnknownFailure;
}
