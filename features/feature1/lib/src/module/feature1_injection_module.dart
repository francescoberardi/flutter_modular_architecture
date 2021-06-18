import 'dart:async';

import 'package:feature1/src/data/datasources/feature1_local_data_source.dart';
import 'package:feature1/src/data/datasources/feature1_remote_data_source.dart';
import 'package:feature1/src/data/repositories/feature1_repository_impl.dart';
import 'package:feature1/src/domain/repositories/feature1_repository.dart';
import 'package:feature1/src/domain/usecases/feature1_usecase.dart';
import 'package:feature1/src/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

class Feature1InjectionModule extends InjectionModule {
  Feature1InjectionModule(GetIt injector) {
    InjectionModule.injector = injector;
  }

  @override
  FutureOr<void> registerDependencies() {
    // Bloc
    InjectionModule.injector.registerFactory<Feature1Bloc>(
      () => Feature1Bloc(
        feature1UseCase: InjectionModule.injector(),
      ),
    );

    // Use cases
    InjectionModule.injector.registerLazySingleton<Feature1UseCase>(
      () => Feature1UseCase(
        repository: InjectionModule.injector(),
      ),
    );

    // Repository
    InjectionModule.injector.registerLazySingleton<Feature1Repository>(
      () => Feature1RepositoryImpl(
        remoteDataSource: InjectionModule.injector(),
        localDataSource: InjectionModule.injector(),
        networkInfo: InjectionModule.injector(),
      ),
    );

    // Data sources
    InjectionModule.injector.registerLazySingleton<Feature1RemoteDataSource>(
      () => Feature1RemoteDataSourceImpl(),
    );
    InjectionModule.injector.registerLazySingleton<Feature1LocalDataSource>(
      () => Feature1LocalDataSourceImpl(),
    );
  }
}
