import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class InjectionModule {
  static late GetIt injector;
  FutureOr<void> registerDependencies();
}
