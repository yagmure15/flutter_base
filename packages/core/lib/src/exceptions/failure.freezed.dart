// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerFailure value)?  server,TResult Function( _CacheFailure value)?  cache,TResult Function( _NetworkFailure value)?  network,TResult Function( _UnauthorizedFailure value)?  unauthorized,TResult Function( _NotFoundFailure value)?  notFound,TResult Function( _ValidationFailure value)?  validation,TResult Function( _UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that);case _CacheFailure() when cache != null:
return cache(_that);case _NetworkFailure() when network != null:
return network(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ValidationFailure() when validation != null:
return validation(_that);case _UnknownFailure() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerFailure value)  server,required TResult Function( _CacheFailure value)  cache,required TResult Function( _NetworkFailure value)  network,required TResult Function( _UnauthorizedFailure value)  unauthorized,required TResult Function( _NotFoundFailure value)  notFound,required TResult Function( _ValidationFailure value)  validation,required TResult Function( _UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case _ServerFailure():
return server(_that);case _CacheFailure():
return cache(_that);case _NetworkFailure():
return network(_that);case _UnauthorizedFailure():
return unauthorized(_that);case _NotFoundFailure():
return notFound(_that);case _ValidationFailure():
return validation(_that);case _UnknownFailure():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerFailure value)?  server,TResult? Function( _CacheFailure value)?  cache,TResult? Function( _NetworkFailure value)?  network,TResult? Function( _UnauthorizedFailure value)?  unauthorized,TResult? Function( _NotFoundFailure value)?  notFound,TResult? Function( _ValidationFailure value)?  validation,TResult? Function( _UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that);case _CacheFailure() when cache != null:
return cache(_that);case _NetworkFailure() when network != null:
return network(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ValidationFailure() when validation != null:
return validation(_that);case _UnknownFailure() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  int? code)?  server,TResult Function( String message,  int? code)?  cache,TResult Function( String message)?  network,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String message,  Map<String, dynamic>? errors)?  validation,TResult Function( String message,  dynamic error)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that.message,_that.code);case _CacheFailure() when cache != null:
return cache(_that.message,_that.code);case _NetworkFailure() when network != null:
return network(_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case _NotFoundFailure() when notFound != null:
return notFound(_that.message);case _ValidationFailure() when validation != null:
return validation(_that.message,_that.errors);case _UnknownFailure() when unknown != null:
return unknown(_that.message,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  int? code)  server,required TResult Function( String message,  int? code)  cache,required TResult Function( String message)  network,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String message,  Map<String, dynamic>? errors)  validation,required TResult Function( String message,  dynamic error)  unknown,}) {final _that = this;
switch (_that) {
case _ServerFailure():
return server(_that.message,_that.code);case _CacheFailure():
return cache(_that.message,_that.code);case _NetworkFailure():
return network(_that.message);case _UnauthorizedFailure():
return unauthorized(_that.message);case _NotFoundFailure():
return notFound(_that.message);case _ValidationFailure():
return validation(_that.message,_that.errors);case _UnknownFailure():
return unknown(_that.message,_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  int? code)?  server,TResult? Function( String message,  int? code)?  cache,TResult? Function( String message)?  network,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String message,  Map<String, dynamic>? errors)?  validation,TResult? Function( String message,  dynamic error)?  unknown,}) {final _that = this;
switch (_that) {
case _ServerFailure() when server != null:
return server(_that.message,_that.code);case _CacheFailure() when cache != null:
return cache(_that.message,_that.code);case _NetworkFailure() when network != null:
return network(_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case _NotFoundFailure() when notFound != null:
return notFound(_that.message);case _ValidationFailure() when validation != null:
return validation(_that.message,_that.errors);case _UnknownFailure() when unknown != null:
return unknown(_that.message,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ServerFailure implements Failure {
  const _ServerFailure(this.message, [this.code]);
  

@override final  String message;
 final  int? code;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerFailureCopyWith<_ServerFailure> get copyWith => __$ServerFailureCopyWithImpl<_ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,message,code);

@override
String toString() {
  return 'Failure.server(message: $message, code: $code)';
}


}

/// @nodoc
abstract mixin class _$ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ServerFailureCopyWith(_ServerFailure value, $Res Function(_ServerFailure) _then) = __$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? code
});




}
/// @nodoc
class __$ServerFailureCopyWithImpl<$Res>
    implements _$ServerFailureCopyWith<$Res> {
  __$ServerFailureCopyWithImpl(this._self, this._then);

  final _ServerFailure _self;
  final $Res Function(_ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,}) {
  return _then(_ServerFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _CacheFailure implements Failure {
  const _CacheFailure(this.message, [this.code]);
  

@override final  String message;
 final  int? code;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CacheFailureCopyWith<_CacheFailure> get copyWith => __$CacheFailureCopyWithImpl<_CacheFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,message,code);

@override
String toString() {
  return 'Failure.cache(message: $message, code: $code)';
}


}

/// @nodoc
abstract mixin class _$CacheFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$CacheFailureCopyWith(_CacheFailure value, $Res Function(_CacheFailure) _then) = __$CacheFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, int? code
});




}
/// @nodoc
class __$CacheFailureCopyWithImpl<$Res>
    implements _$CacheFailureCopyWith<$Res> {
  __$CacheFailureCopyWithImpl(this._self, this._then);

  final _CacheFailure _self;
  final $Res Function(_CacheFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,}) {
  return _then(_CacheFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _NetworkFailure implements Failure {
  const _NetworkFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkFailureCopyWith<_NetworkFailure> get copyWith => __$NetworkFailureCopyWithImpl<_NetworkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.network(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NetworkFailureCopyWith(_NetworkFailure value, $Res Function(_NetworkFailure) _then) = __$NetworkFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NetworkFailureCopyWithImpl<$Res>
    implements _$NetworkFailureCopyWith<$Res> {
  __$NetworkFailureCopyWithImpl(this._self, this._then);

  final _NetworkFailure _self;
  final $Res Function(_NetworkFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnauthorizedFailure implements Failure {
  const _UnauthorizedFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedFailureCopyWith<_UnauthorizedFailure> get copyWith => __$UnauthorizedFailureCopyWithImpl<_UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnauthorizedFailureCopyWith(_UnauthorizedFailure value, $Res Function(_UnauthorizedFailure) _then) = __$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnauthorizedFailureCopyWithImpl<$Res>
    implements _$UnauthorizedFailureCopyWith<$Res> {
  __$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final _UnauthorizedFailure _self;
  final $Res Function(_UnauthorizedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UnauthorizedFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NotFoundFailure implements Failure {
  const _NotFoundFailure(this.message);
  

@override final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundFailureCopyWith<_NotFoundFailure> get copyWith => __$NotFoundFailureCopyWithImpl<_NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotFoundFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NotFoundFailureCopyWith(_NotFoundFailure value, $Res Function(_NotFoundFailure) _then) = __$NotFoundFailureCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotFoundFailureCopyWithImpl<$Res>
    implements _$NotFoundFailureCopyWith<$Res> {
  __$NotFoundFailureCopyWithImpl(this._self, this._then);

  final _NotFoundFailure _self;
  final $Res Function(_NotFoundFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotFoundFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ValidationFailure implements Failure {
  const _ValidationFailure(this.message, [ Map<String, dynamic>? errors]): _errors = errors;
  

@override final  String message;
 final  Map<String, dynamic>? _errors;
 Map<String, dynamic>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationFailureCopyWith<_ValidationFailure> get copyWith => __$ValidationFailureCopyWithImpl<_ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._errors, _errors));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'Failure.validation(message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ValidationFailureCopyWith(_ValidationFailure value, $Res Function(_ValidationFailure) _then) = __$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, dynamic>? errors
});




}
/// @nodoc
class __$ValidationFailureCopyWithImpl<$Res>
    implements _$ValidationFailureCopyWith<$Res> {
  __$ValidationFailureCopyWithImpl(this._self, this._then);

  final _ValidationFailure _self;
  final $Res Function(_ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? errors = freezed,}) {
  return _then(_ValidationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class _UnknownFailure implements Failure {
  const _UnknownFailure(this.message, [this.error]);
  

@override final  String message;
 final  dynamic error;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownFailureCopyWith<_UnknownFailure> get copyWith => __$UnknownFailureCopyWithImpl<_UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownFailure&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Failure.unknown(message: $message, error: $error)';
}


}

/// @nodoc
abstract mixin class _$UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnknownFailureCopyWith(_UnknownFailure value, $Res Function(_UnknownFailure) _then) = __$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, dynamic error
});




}
/// @nodoc
class __$UnknownFailureCopyWithImpl<$Res>
    implements _$UnknownFailureCopyWith<$Res> {
  __$UnknownFailureCopyWithImpl(this._self, this._then);

  final _UnknownFailure _self;
  final $Res Function(_UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,}) {
  return _then(_UnknownFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
