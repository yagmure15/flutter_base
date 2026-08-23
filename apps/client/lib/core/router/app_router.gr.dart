// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [TestFeaturePage]
class TestFeatureRoute extends PageRouteInfo<void> {
  const TestFeatureRoute({List<PageRouteInfo>? children})
    : super(TestFeatureRoute.name, initialChildren: children);

  static const String name = 'TestFeatureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestFeaturePage();
    },
  );
}
