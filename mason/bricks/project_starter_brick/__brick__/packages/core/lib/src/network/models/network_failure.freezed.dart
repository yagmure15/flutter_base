// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure()';
}


}

/// @nodoc
class $NetworkFailureCopyWith<$Res>  {
$NetworkFailureCopyWith(NetworkFailure _, $Res Function(NetworkFailure) __);
}


/// Adds pattern-matching-related methods to [NetworkFailure].
extension NetworkFailurePatterns on NetworkFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerError value)?  serverError,TResult Function( _NetworkConnection value)?  networkConnection,TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _NotFound value)?  notFound,TResult Function( _Unknown value)?  unknown,TResult Function( _Canceled value)?  canceled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkConnection() when networkConnection != null:
return networkConnection(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _Canceled() when canceled != null:
return canceled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerError value)  serverError,required TResult Function( _NetworkConnection value)  networkConnection,required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _NotFound value)  notFound,required TResult Function( _Unknown value)  unknown,required TResult Function( _Canceled value)  canceled,}){
final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that);case _NetworkConnection():
return networkConnection(_that);case _Unauthorized():
return unauthorized(_that);case _NotFound():
return notFound(_that);case _Unknown():
return unknown(_that);case _Canceled():
return canceled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerError value)?  serverError,TResult? Function( _NetworkConnection value)?  networkConnection,TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _NotFound value)?  notFound,TResult? Function( _Unknown value)?  unknown,TResult? Function( _Canceled value)?  canceled,}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _NetworkConnection() when networkConnection != null:
return networkConnection(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _Unknown() when unknown != null:
return unknown(_that);case _Canceled() when canceled != null:
return canceled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function( String message)?  networkConnection,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String message)?  unknown,TResult Function()?  canceled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkConnection() when networkConnection != null:
return networkConnection(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _NotFound() when notFound != null:
return notFound(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _Canceled() when canceled != null:
return canceled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function( String message)  networkConnection,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String message)  unknown,required TResult Function()  canceled,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that.message);case _NetworkConnection():
return networkConnection(_that.message);case _Unauthorized():
return unauthorized(_that.message);case _NotFound():
return notFound(_that.message);case _Unknown():
return unknown(_that.message);case _Canceled():
return canceled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function( String message)?  networkConnection,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String message)?  unknown,TResult? Function()?  canceled,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _NetworkConnection() when networkConnection != null:
return networkConnection(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _NotFound() when notFound != null:
return notFound(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _Canceled() when canceled != null:
return canceled();case _:
  return null;

}
}

}

/// @nodoc


class _ServerError implements NetworkFailure {
  const _ServerError(this.message);
  

 final  String message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NetworkFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NetworkConnection implements NetworkFailure {
  const _NetworkConnection(this.message);
  

 final  String message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkConnectionCopyWith<_NetworkConnection> get copyWith => __$NetworkConnectionCopyWithImpl<_NetworkConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkConnection&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NetworkFailure.networkConnection(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkConnectionCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory _$NetworkConnectionCopyWith(_NetworkConnection value, $Res Function(_NetworkConnection) _then) = __$NetworkConnectionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NetworkConnectionCopyWithImpl<$Res>
    implements _$NetworkConnectionCopyWith<$Res> {
  __$NetworkConnectionCopyWithImpl(this._self, this._then);

  final _NetworkConnection _self;
  final $Res Function(_NetworkConnection) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NetworkConnection(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unauthorized implements NetworkFailure {
  const _Unauthorized(this.message);
  

 final  String message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedCopyWith<_Unauthorized> get copyWith => __$UnauthorizedCopyWithImpl<_Unauthorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NetworkFailure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(_Unauthorized value, $Res Function(_Unauthorized) _then) = __$UnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(this._self, this._then);

  final _Unauthorized _self;
  final $Res Function(_Unauthorized) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unauthorized(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NotFound implements NetworkFailure {
  const _NotFound(this.message);
  

 final  String message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundCopyWith<_NotFound> get copyWith => __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NetworkFailure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) = __$NotFoundCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotFound(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unknown implements NetworkFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownCopyWith<_Unknown> get copyWith => __$UnknownCopyWithImpl<_Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NetworkFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) = __$UnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(this._self, this._then);

  final _Unknown _self;
  final $Res Function(_Unknown) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Canceled implements NetworkFailure {
  const _Canceled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Canceled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure.canceled()';
}


}




// dart format on
