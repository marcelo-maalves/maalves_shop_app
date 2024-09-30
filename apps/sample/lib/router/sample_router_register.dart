import 'package:auth/auth.dart';
import 'package:foundation/go_router.dart';

class SampleRouterRegister extends AppRouterRegister {
  SampleRouterRegister()
      : super(
          initialLocation: AuthRoutes.signIn,
          /*redirect: (context, state) {
            final location = state.uri.toString();
            //TODO: Remove this when update routes
            if (location.contains('supplier') &&
                !location.contains('emporium')) {
              return '/$location';
            } else if (location.contains('app/')) {
              // This is a workaround to remove the app/ from
              // Customer IO url action values
              return location.replaceFirst('app/', '');
            }
            return location;
          },*/
          onException: (context, state, router) {},
          packagesRoutesRegister: [
            AuthPackageRoutesRegister(),
          ],
        );
}
