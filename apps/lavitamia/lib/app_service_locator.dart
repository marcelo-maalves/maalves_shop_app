import 'package:auth/auth.dart' as auth;

class AppServiceLocator {
  AppServiceLocator._();

  static Future<void> _initAppServiceLocator() async {}

  static Future<void> init() async {
    await _initAppServiceLocator();
    await auth.initServiceLocator();
  }
}
