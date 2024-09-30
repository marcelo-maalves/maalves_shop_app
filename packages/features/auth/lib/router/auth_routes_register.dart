import 'package:auth/sign_in/presentation/route/sign_in_router.dart';
import 'package:auth/router/landing_router.dart';
import 'package:foundation/router/package_routes_register.dart';

class AuthPackageRoutesRegister extends PackageRoutesRegister {
  AuthPackageRoutesRegister()
      : super(
          routes: [
            AuthRouter(),
            LandingRouter(),
          ],
        );
}
