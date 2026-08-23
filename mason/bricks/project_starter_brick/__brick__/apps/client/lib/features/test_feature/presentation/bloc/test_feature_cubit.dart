import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';
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
    switch (result) {
      case Success(:final data):
        emit(TestFeatureState.success(data));
      case FailureResult(:final failure):
        emit(TestFeatureState.error(failure));
    }
  }
}
