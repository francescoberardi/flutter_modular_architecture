import 'dart:async';

import 'package:get_it/get_it.dart';

import '../network/network_info.dart';
import '../network/network_info_impl.dart';
import 'injection_module.dart';

/// Class for handling the dependencies of Shared module
class SharedInjectionModule implements InjectionModule {
  /// Default constructor
  SharedInjectionModule(GetIt injector) {
    InjectionModule.injector = injector;
  }

  @override
  FutureOr<void> registerDependencies() {
    InjectionModule.injector
        .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  }
}
