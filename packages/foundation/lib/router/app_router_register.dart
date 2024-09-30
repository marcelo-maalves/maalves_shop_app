import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package_routes_register.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterRegister extends GoRouter {
  AppRouterRegister({
    required String initialLocation,
    required List<PackageRoutesRegister> packagesRoutesRegister,
    super.redirect,
    super.onException,
  }) : super(
          navigatorKey: rootNavigatorKey,
          initialLocation: initialLocation,
          routes: [
            ...packagesRoutesRegister.expand((element) => element.routes),
          ],
        );
}
