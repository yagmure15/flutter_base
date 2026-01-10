// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) then) =
      _$NetworkFailureCopyWithImpl<$Res, NetworkFailure>;
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res, $Val extends NetworkFailure>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements NetworkFailure {
  const factory _ServerError(final String message) = _$ServerErrorImpl;

  String get message;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkConnectionImplCopyWith<$Res> {
  factory _$$NetworkConnectionImplCopyWith(_$NetworkConnectionImpl value,
          $Res Function(_$NetworkConnectionImpl) then) =
      __$$NetworkConnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkConnectionImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$NetworkConnectionImpl>
    implements _$$NetworkConnectionImplCopyWith<$Res> {
  __$$NetworkConnectionImplCopyWithImpl(_$NetworkConnectionImpl _value,
      $Res Function(_$NetworkConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkConnectionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkConnectionImpl implements _NetworkConnection {
  const _$NetworkConnectionImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.networkConnection(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkConnectionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkConnectionImplCopyWith<_$NetworkConnectionImpl> get copyWith =>
      __$$NetworkConnectionImplCopyWithImpl<_$NetworkConnectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return networkConnection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return networkConnection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (networkConnection != null) {
      return networkConnection(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return networkConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return networkConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (networkConnection != null) {
      return networkConnection(this);
    }
    return orElse();
  }
}

abstract class _NetworkConnection implements NetworkFailure {
  const factory _NetworkConnection(final String message) =
      _$NetworkConnectionImpl;

  String get message;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkConnectionImplCopyWith<_$NetworkConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements NetworkFailure {
  const factory _Unauthorized(final String message) = _$UnauthorizedImpl;

  String get message;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl implements _NotFound {
  const _$NotFoundImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements NetworkFailure {
  const factory _NotFound(final String message) = _$NotFoundImpl;

  String get message;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements NetworkFailure {
  const factory _Unknown(final String message) = _$UnknownImpl;

  String get message;

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CanceledImplCopyWith<$Res> {
  factory _$$CanceledImplCopyWith(
          _$CanceledImpl value, $Res Function(_$CanceledImpl) then) =
      __$$CanceledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CanceledImplCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$CanceledImpl>
    implements _$$CanceledImplCopyWith<$Res> {
  __$$CanceledImplCopyWithImpl(
      _$CanceledImpl _value, $Res Function(_$CanceledImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CanceledImpl implements _Canceled {
  const _$CanceledImpl();

  @override
  String toString() {
    return 'NetworkFailure.canceled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CanceledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkConnection,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unknown,
    required TResult Function() canceled,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkConnection,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unknown,
    TResult? Function()? canceled,
  }) {
    return canceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkConnection,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unknown,
    TResult Function()? canceled,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NetworkConnection value) networkConnection,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Canceled value) canceled,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NetworkConnection value)? networkConnection,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Canceled value)? canceled,
  }) {
    return canceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NetworkConnection value)? networkConnection,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Canceled value)? canceled,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class _Canceled implements NetworkFailure {
  const factory _Canceled() = _$CanceledImpl;
}
