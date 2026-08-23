import 'package:flutter_base_core/flutter_base_core.dart';

import '../translations/strings.g.dart';

/// User-facing text for a [Failure].
///
/// Backend-provided validation messages are shown as-is (they are written for
/// end users); everything else maps to a localized, generic message from the
/// `errors` translation namespace. The original [Failure.message] stays
/// available for logging.
extension FailureLocalization on Failure {
  String get localizedMessage => switch (this) {
    NetworkFailure() => t.errors.network,
    ServerFailure() => t.errors.server,
    UnauthorizedFailure() => t.errors.unauthorized,
    ForbiddenFailure() => t.errors.forbidden,
    NotFoundFailure() => t.errors.notFound,
    ValidationFailure(:final message) =>
      message.trim().isNotEmpty ? message : t.errors.validation,
    CacheFailure() => t.errors.cache,
    CanceledFailure() => t.errors.canceled,
    UnknownFailure() => t.errors.unknown,
  };
}
