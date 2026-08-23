import 'package:flutter/foundation.dart' show immutable;

import '../exceptions/failure.dart';
import '../exceptions/failure_mapper.dart';
import '../logger/log_it.dart';

/// Outcome of an operation that can fail with a [Failure].
///
/// Repositories and use cases return `Future<Result<T>>`; consumers either
/// pattern match or use the helpers ([fold], [map], [dataOrNull], ...):
///
/// ```dart
/// final result = await Result.guard(() => api.fetchUser());
/// switch (result) {
///   case Success(:final data):
///     emit(State.loaded(data));
///   case FailureResult(:final failure):
///     emit(State.error(failure));
/// }
/// ```
sealed class Result<T> {
  const Result();

  const factory Result.success(T data) = Success<T>;

  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Runs [call] and wraps its value in a [Success], or whatever it throws
  /// (Dio errors, `AppException`s, ...) in a [FailureResult] via
  /// [failureFromException].
  static Future<Result<T>> guard<T>(Future<T> Function() call) async {
    try {
      return Success(await call());
    } catch (error, stackTrace) {
      final failure = failureFromException(error);
      if (failure is UnknownFailure) {
        logger.warn(
          'Unclassified error mapped to Failure.unknown',
          error: error,
          stackTrace: stackTrace,
        );
      }
      return FailureResult(failure);
    }
  }

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    FailureResult() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success() => null,
    FailureResult(:final failure) => failure,
  };

  /// Reduces both cases to a single value.
  R fold<R>({
    required R Function(Failure failure) onFailure,
    required R Function(T data) onSuccess,
  }) => switch (this) {
    Success(:final data) => onSuccess(data),
    FailureResult(:final failure) => onFailure(failure),
  };

  /// Transforms the success value (e.g. model → entity); failures pass through.
  Result<R> map<R>(R Function(T data) transform) => switch (this) {
    Success(:final data) => Success(transform(data)),
    FailureResult(:final failure) => FailureResult(failure),
  };

  /// Chains another fallible step; failures pass through.
  Result<R> flatMap<R>(Result<R> Function(T data) transform) => switch (this) {
    Success(:final data) => transform(data),
    FailureResult(:final failure) => FailureResult(failure),
  };
}

@immutable
final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && other.data == data;

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() => 'Success<$T>($data)';
}

@immutable
final class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  final Failure failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult<T> && other.failure == failure;

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() => 'FailureResult<$T>($failure)';
}
