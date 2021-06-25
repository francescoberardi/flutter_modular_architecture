import 'dart:async';

import 'package:feature1/feature1.dart';
import 'package:feature_cubit/feature_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

final injector = GetIt.instance;

FutureOr<void> init() async {
  await _initThirdPartyLibraries();
  await _initCoreModules();
  await _initFeatures();
}

FutureOr<void> _initFeatures() async {
  final feature1Injector = Feature1InjectionModule(injector);
  await feature1Injector.registerDependencies();

  final featureCubitInjector = FeatureCubitInjectionModule(injector);
  await featureCubitInjector.registerDependencies();
}

FutureOr<void> _initCoreModules() async {
  final sharedInjector = SharedInjectionModule(injector);
  await sharedInjector.registerDependencies();
}

FutureOr<void> _initThirdPartyLibraries() async {}
