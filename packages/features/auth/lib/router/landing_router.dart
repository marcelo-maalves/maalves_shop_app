import 'package:auth/auth/presentation/screen/landing_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:foundation/go_router.dart';

class LandingRouter extends GoRoute {
  LandingRouter()
      : super(
          parentNavigatorKey: rootNavigatorKey,
          path: AuthRoutes.landing,
          name: AuthRoutes.landing,
          pageBuilder: (context, state) {
            return MaterialTransition(
              key: state.pageKey,
              builder: (context) {
                return LandingScreen(
                  onEnterPressed: () => context.push(AuthRoutes.signIn),
                );
              },
            );
          },
        );
}
