import 'network_failure.dart';

/// Dart 3 Sealed Class Pattern
sealed class DataResult<T> {
  const DataResult();
}

final class Success<T> extends DataResult<T> {
  const Success(this.data);
  final T data;
}

final class FailureResult<T> extends DataResult<T> {
  const FailureResult(this.failure);
  final NetworkFailure failure;
}
