import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// [Failure] is the base class for all errors in the **Domain & UI Layers**.
///
/// **Purpose:**
/// Failures are user-friendly, safe representations of errors. Unlike Exceptions,
/// they are clean, predictable, and do not contain stack traces or technical jargon (unless debugging).
///
/// **Usage:**
/// Return `Either<Failure, Type>` from your Repositories.
/// The UI then checks 'switches' on the failure type to decide what to show user.
///
/// **Example Mapping (Repository):**
/// ```dart
/// try {
///   final result = await remoteDataSource.getData();
///   return Right(result);
/// } on ServerException catch (e) {
///   return Left(Failure.server(e.message));
/// }
/// ```
///
/// **Example Consumption (UI/Bloc):**
/// ```dart
/// result.fold(
///   (failure) => failure.when(
///     server: (msg, _) => showErrorDialog(msg),
///     unauthorized: (msg) => navigateToLogin(),
///     validation: (msg, errors) => showInputErrors(errors),
///     // ... other cases
///   ),
///   (success) => showContent(success),
/// );
/// ```
@freezed
sealed class Failure with _$Failure {
  const factory Failure.server(String message, [int? code]) = _ServerFailure;
  const factory Failure.cache(String message, [int? code]) = _CacheFailure;
  const factory Failure.network(String message) = _NetworkFailure;
  const factory Failure.unauthorized(String message) = _UnauthorizedFailure;
  const factory Failure.notFound(String message) = _NotFoundFailure;
  const factory Failure.validation(
    String message, [
    Map<String, dynamic>? errors,
  ]) = _ValidationFailure;
  const factory Failure.unknown(String message, [dynamic error]) =
      _UnknownFailure;
}
