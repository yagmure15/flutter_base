// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestFeatureModel _$TestFeatureModelFromJson(Map<String, dynamic> json) {
  return _TestFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$TestFeatureModel {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestFeatureModelCopyWith<TestFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestFeatureModelCopyWith<$Res> {
  factory $TestFeatureModelCopyWith(
          TestFeatureModel value, $Res Function(TestFeatureModel) then) =
      _$TestFeatureModelCopyWithImpl<$Res, TestFeatureModel>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$TestFeatureModelCopyWithImpl<$Res, $Val extends TestFeatureModel>
    implements $TestFeatureModelCopyWith<$Res> {
  _$TestFeatureModelCopyWithImpl(this._value, this._then);

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
abstract class _$$TestFeatureModelImplCopyWith<$Res>
    implements $TestFeatureModelCopyWith<$Res> {
  factory _$$TestFeatureModelImplCopyWith(_$TestFeatureModelImpl value,
          $Res Function(_$TestFeatureModelImpl) then) =
      __$$TestFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$TestFeatureModelImplCopyWithImpl<$Res>
    extends _$TestFeatureModelCopyWithImpl<$Res, _$TestFeatureModelImpl>
    implements _$$TestFeatureModelImplCopyWith<$Res> {
  __$$TestFeatureModelImplCopyWithImpl(_$TestFeatureModelImpl _value,
      $Res Function(_$TestFeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$TestFeatureModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestFeatureModelImpl implements _TestFeatureModel {
  const _$TestFeatureModelImpl({required this.id});

  factory _$TestFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestFeatureModelImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'TestFeatureModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestFeatureModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestFeatureModelImplCopyWith<_$TestFeatureModelImpl> get copyWith =>
      __$$TestFeatureModelImplCopyWithImpl<_$TestFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _TestFeatureModel implements TestFeatureModel {
  const factory _TestFeatureModel({required final String id}) =
      _$TestFeatureModelImpl;

  factory _TestFeatureModel.fromJson(Map<String, dynamic> json) =
      _$TestFeatureModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$TestFeatureModelImplCopyWith<_$TestFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
