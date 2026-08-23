import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_base/features/test_feature/domain/entities/test_feature.dart';
import 'package:flutter_base/features/test_feature/domain/usecases/get_test_feature.dart';
import 'package:flutter_base/features/test_feature/presentation/bloc/test_feature_cubit.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTestFeature extends Mock implements GetTestFeature {}

void main() {
  late MockGetTestFeature getTestFeature;

  setUp(() {
    getTestFeature = MockGetTestFeature();
  });

  group('TestFeatureCubit', () {
    test('initial state is TestFeatureState.initial', () {
      expect(
        TestFeatureCubit(getTestFeature).state,
        const TestFeatureState.initial(),
      );
    });

    blocTest<TestFeatureCubit, TestFeatureState>(
      'emits [loading, success] when the use case succeeds',
      build: () {
        when(
          () => getTestFeature(),
        ).thenAnswer((_) async => const Result.success(TestFeature(id: '1')));
        return TestFeatureCubit(getTestFeature);
      },
      act: (cubit) => cubit.started(),
      expect: () => const [
        TestFeatureState.loading(),
        TestFeatureState.success(TestFeature(id: '1')),
      ],
      verify: (_) => verify(() => getTestFeature()).called(1),
    );

    blocTest<TestFeatureCubit, TestFeatureState>(
      'emits [loading, error] with the failure when the use case fails',
      build: () {
        when(() => getTestFeature()).thenAnswer(
          (_) async => const Result.failure(Failure.server('boom', 500)),
        );
        return TestFeatureCubit(getTestFeature);
      },
      act: (cubit) => cubit.started(),
      expect: () => const [
        TestFeatureState.loading(),
        TestFeatureState.error(Failure.server('boom', 500)),
      ],
    );
  });
}
