import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/src/home/home.dart';
import 'package:stonepro/src/remain/remain.dart';
import 'package:stonepro/src/model/stone.dart';
import 'package:stonepro/src/model/remain.dart';
import 'package:stonepro/src/stone/stone.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(initial: true, path: '/home', page: HomeRoute.page, usesPathAsKey: true, children: []),
        CustomRoute(
          path: '/stone',
          page: StoneRoute.page,
          usesPathAsKey: true,
        ),
        CustomRoute(
          path: '/remain',
          page: RemainRoute.page,
          usesPathAsKey: true,
        ),
      ];
}
