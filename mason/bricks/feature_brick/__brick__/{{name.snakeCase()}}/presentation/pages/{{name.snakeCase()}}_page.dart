import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency/di.dart';
import '../../../../core/translations/strings.g.dart';
import '../bloc/{{name.snakeCase()}}_cubit.dart';

@RoutePage()
class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{name.pascalCase()}}Cubit>()..started(),
      child: Scaffold(
        appBar: AppBar(title: Text(t.{{name.camelCase()}}.title)),
        body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (data) => Center(child: Text('Data: ${data.id}')),
              error: (msg) => Center(child: Text('Error: $msg')),
            );
          },
        ),
      ),
    );
  }
}
