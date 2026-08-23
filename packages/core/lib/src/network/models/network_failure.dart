import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';

@freezed
sealed class NetworkFailure with _$NetworkFailure {
  const factory NetworkFailure.serverError(String message) = _ServerError;
  const factory NetworkFailure.networkConnection(String message) =
      _NetworkConnection;
  const factory NetworkFailure.unauthorized(String message) = _Unauthorized;
  const factory NetworkFailure.notFound(String message) = _NotFound;
  const factory NetworkFailure.unknown(String message) = _Unknown;
  const factory NetworkFailure.canceled() = _Canceled;
}
