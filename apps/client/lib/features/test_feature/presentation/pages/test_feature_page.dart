import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency/di.dart';
import '../../../../core/error/failure_localizer.dart';
import '../bloc/test_feature_cubit.dart';

@RoutePage()
class TestFeaturePage extends StatelessWidget {
  const TestFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TestFeatureCubit>()..started(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Test Feature')),
        body: BlocBuilder<TestFeatureCubit, TestFeatureState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (data) => Center(child: Text('Data: ${data.id}')),
              error: (failure) => Center(child: Text(failure.localizedMessage)),
            );
          },
        ),
      ),
    );
  }
}
