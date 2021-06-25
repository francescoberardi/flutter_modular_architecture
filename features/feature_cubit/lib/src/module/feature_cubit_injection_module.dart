import 'dart:async';

import 'package:feature_cubit/src/data/datasources/feature_cubit_local_data_source.dart';
import 'package:feature_cubit/src/data/datasources/feature_cubit_remote_data_source.dart';
import 'package:feature_cubit/src/data/repositories/feature_cubit_repository_impl.dart';
import 'package:feature_cubit/src/domain/repositories/feature_cubit_repository.dart';
import 'package:feature_cubit/src/domain/usecases/feature_cubit_usecases.dart';
import 'package:feature_cubit/src/presentation/cubit/feature_cubit.dart';
import 'package:shared/shared.dart';
import 'package:get_it/get_it.dart';

class FeatureCubitInjectionModule extends InjectionModule {
  /// Constructor
  FeatureCubitInjectionModule(GetIt injector) {
    InjectionModule.injector = injector;
  }

  @override
  FutureOr<void> registerDependencies() {
    // Cubit
    InjectionModule.injector.registerFactory<FeatureCubit>(
      () => FeatureCubit(
        useCase: InjectionModule.injector(),
      ),
    );

    // Use cases
    InjectionModule.injector.registerLazySingleton<FeatureCubitUseCase>(
      () => FeatureCubitUseCase(
        repository: InjectionModule.injector(),
      ),
    );

    // Repository
    InjectionModule.injector.registerLazySingleton<FeatureCubitRepository>(
      () => FeatureCubitRepositoryImpl(
        remoteDataSource: InjectionModule.injector(),
        localDataSource: InjectionModule.injector(),
        networkInfo: InjectionModule.injector(),
      ),
    );

    // Data sources
    InjectionModule.injector.registerLazySingleton<FeatureCubitLocalDataSource>(
      () => FeatureCubitLocalDataSourceImpl(),
    );

    InjectionModule.injector
        .registerLazySingleton<FeatureCubitRemoteDataSource>(
      () => FeatureCubitRemoteDataSourceImpl(),
    );
  }
}
