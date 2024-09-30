import 'package:lavitamia_app/app_service_locator.dart';

abstract class StartupService {
  static Future<void> _initServiceLocators() async {
    try {
      await AppServiceLocator.init();
    } catch (e) {
      //log('Error initServiceLocator $e');
    }
  }

  static Future<void> onSetup() async {
    // _setupSystemChrome();
    // Intl.defaultLocale = 'pt_BR';
    // EquatableConfig.stringify = kDebugMode;

    // final appEnvironment = await AppEnvironment.appEnvironment(
    //   Environment.fromEnv(),
    // );

    //await FirebaseService.init();
    await _initServiceLocators();
    // await _precacheImages(context);
    // initAnalytics(appEnvironment);
  }
}
