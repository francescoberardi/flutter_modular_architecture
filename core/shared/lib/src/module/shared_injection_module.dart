import 'dart:async';

import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:get_it/get_it.dart';

import '../../shared.dart';

class SharedInjectionModule implements InjectionModule {
  SharedInjectionModule(GetIt injector) {
    InjectionModule.injector = injector;
  }

  @override
  FutureOr<void> registerDependencies() {
    //Service
    InjectionModule.injector.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(connectivity: InjectionModule.injector()));

    // External
    InjectionModule.injector
        .registerLazySingleton<Connectivity>(() => Connectivity());
  }
}
