import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
