import 'package:go_router/go_router.dart';

abstract class PackageRoutesRegister {
  const PackageRoutesRegister({
    required this.routes,
  });

  final List<RouteBase> routes;
}
