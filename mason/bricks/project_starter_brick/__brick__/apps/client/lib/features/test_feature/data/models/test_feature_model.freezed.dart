// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestFeatureModel {

 String get id;
/// Create a copy of TestFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestFeatureModelCopyWith<TestFeatureModel> get copyWith => _$TestFeatureModelCopyWithImpl<TestFeatureModel>(this as TestFeatureModel, _$identity);

  /// Serializes this TestFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestFeatureModel&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TestFeatureModel(id: $id)';
}


}

/// @nodoc
abstract mixin class $TestFeatureModelCopyWith<$Res>  {
  factory $TestFeatureModelCopyWith(TestFeatureModel value, $Res Function(TestFeatureModel) _then) = _$TestFeatureModelCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TestFeatureModelCopyWithImpl<$Res>
    implements $TestFeatureModelCopyWith<$Res> {
  _$TestFeatureModelCopyWithImpl(this._self, this._then);

  final TestFeatureModel _self;
  final $Res Function(TestFeatureModel) _then;

/// Create a copy of TestFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(TestFeatureModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TestFeatureModel].
extension TestFeatureModelPatterns on TestFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestFeatureModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _TestFeatureModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _TestFeatureModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestFeatureModel() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _TestFeatureModel():
return $default(_that.id);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _TestFeatureModel() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestFeatureModel extends TestFeatureModel {
  const _TestFeatureModel({required this.id}): super._();
  factory _TestFeatureModel.fromJson(Map<String, dynamic> json) => _$TestFeatureModelFromJson(json);

@override final  String id;

/// Create a copy of TestFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestFeatureModelCopyWith<_TestFeatureModel> get copyWith => __$TestFeatureModelCopyWithImpl<_TestFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestFeatureModel&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TestFeatureModel(id: $id)';
}


}

/// @nodoc
abstract mixin class _$TestFeatureModelCopyWith<$Res> implements $TestFeatureModelCopyWith<$Res> {
  factory _$TestFeatureModelCopyWith(_TestFeatureModel value, $Res Function(_TestFeatureModel) _then) = __$TestFeatureModelCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$TestFeatureModelCopyWithImpl<$Res>
    implements _$TestFeatureModelCopyWith<$Res> {
  __$TestFeatureModelCopyWithImpl(this._self, this._then);

  final _TestFeatureModel _self;
  final $Res Function(_TestFeatureModel) _then;

/// Create a copy of TestFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_TestFeatureModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
