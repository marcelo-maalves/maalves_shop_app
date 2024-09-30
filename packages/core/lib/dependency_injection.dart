import 'package:get_it/get_it.dart';

/// The main registry for dependencies.
///
/// Other packages' service locators should injected them here for
/// application wide contexts.
final GetIt di = GetIt.instance;
