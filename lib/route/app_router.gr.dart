// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    RemainRoute.name: (routeData) {
      final args = routeData.argsAs<RemainRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RemainScreen(
          key: args.key,
          stone: args.stone,
          remain: args.remain,
        ),
      );
    },
    StoneRoute.name: (routeData) {
      final args = routeData.argsAs<StoneRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoneScreen(
          key: args.key,
          stone: args.stone,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RemainScreen]
class RemainRoute extends PageRouteInfo<RemainRouteArgs> {
  RemainRoute({
    Key? key,
    required Stone stone,
    Remain? remain,
    List<PageRouteInfo>? children,
  }) : super(
          RemainRoute.name,
          args: RemainRouteArgs(
            key: key,
            stone: stone,
            remain: remain,
          ),
          initialChildren: children,
        );

  static const String name = 'RemainRoute';

  static const PageInfo<RemainRouteArgs> page = PageInfo<RemainRouteArgs>(name);
}

class RemainRouteArgs {
  const RemainRouteArgs({
    this.key,
    required this.stone,
    this.remain,
  });

  final Key? key;

  final Stone stone;

  final Remain? remain;

  @override
  String toString() {
    return 'RemainRouteArgs{key: $key, stone: $stone, remain: $remain}';
  }
}

/// generated route for
/// [StoneScreen]
class StoneRoute extends PageRouteInfo<StoneRouteArgs> {
  StoneRoute({
    Key? key,
    required Stone stone,
    List<PageRouteInfo>? children,
  }) : super(
          StoneRoute.name,
          args: StoneRouteArgs(
            key: key,
            stone: stone,
          ),
          initialChildren: children,
        );

  static const String name = 'StoneRoute';

  static const PageInfo<StoneRouteArgs> page = PageInfo<StoneRouteArgs>(name);
}

class StoneRouteArgs {
  const StoneRouteArgs({
    this.key,
    required this.stone,
  });

  final Key? key;

  final Stone stone;

  @override
  String toString() {
    return 'StoneRouteArgs{key: $key, stone: $stone}';
  }
}
