// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestFeature {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestFeatureCopyWith<TestFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestFeatureCopyWith<$Res> {
  factory $TestFeatureCopyWith(
          TestFeature value, $Res Function(TestFeature) then) =
      _$TestFeatureCopyWithImpl<$Res, TestFeature>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$TestFeatureCopyWithImpl<$Res, $Val extends TestFeature>
    implements $TestFeatureCopyWith<$Res> {
  _$TestFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestFeatureImplCopyWith<$Res>
    implements $TestFeatureCopyWith<$Res> {
  factory _$$TestFeatureImplCopyWith(
          _$TestFeatureImpl value, $Res Function(_$TestFeatureImpl) then) =
      __$$TestFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$TestFeatureImplCopyWithImpl<$Res>
    extends _$TestFeatureCopyWithImpl<$Res, _$TestFeatureImpl>
    implements _$$TestFeatureImplCopyWith<$Res> {
  __$$TestFeatureImplCopyWithImpl(
      _$TestFeatureImpl _value, $Res Function(_$TestFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$TestFeatureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestFeatureImpl extends _TestFeature {
  const _$TestFeatureImpl({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'TestFeature(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestFeatureImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestFeatureImplCopyWith<_$TestFeatureImpl> get copyWith =>
      __$$TestFeatureImplCopyWithImpl<_$TestFeatureImpl>(this, _$identity);
}

abstract class _TestFeature extends TestFeature {
  const factory _TestFeature({required final String id}) = _$TestFeatureImpl;
  const _TestFeature._() : super._();

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$TestFeatureImplCopyWith<_$TestFeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
