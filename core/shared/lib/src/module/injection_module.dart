import 'dart:async';

import 'package:get_it/get_it.dart';

/// Base class for dependency handling
abstract class InjectionModule {
  /// Property for access the global service locator
  static late GetIt injector;

  /// Method for register all module dependencies
  FutureOr<void> registerDependencies();
}
