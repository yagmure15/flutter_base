import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/test_feature.dart';
import '../../domain/usecases/get_test_feature.dart';

part 'test_feature_cubit.freezed.dart';
part 'test_feature_state.dart';

@injectable
class TestFeatureCubit extends Cubit<TestFeatureState> {
  TestFeatureCubit(this._getTestFeature)
    : super(const TestFeatureState.initial());

  final GetTestFeature _getTestFeature;

  Future<void> started() async {
    emit(const TestFeatureState.loading());
    final result = await _getTestFeature();
    result.fold(
      (failure) => emit(TestFeatureState.error(failure.toString())),
      (data) => emit(TestFeatureState.success(data)),
    );
  }
}
