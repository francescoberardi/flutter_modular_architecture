import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

import '../../domain/entities/feature_cubit_entity.dart';
import '../../domain/repositories/feature_cubit_repository.dart';
import '../datasources/feature_cubit_local_data_source.dart';
import '../datasources/feature_cubit_remote_data_source.dart';

/// Default implementation for FeatureCubit repository
class FeatureCubitRepositoryImpl implements FeatureCubitRepository {
  /// Remote data source property
  final FeatureCubitRemoteDataSource remoteDataSource;

  /// Local data source property
  final FeatureCubitLocalDataSource localDataSource;

  /// Network info property used to check if connection is available
  final NetworkInfo networkInfo;

  /// Default constructor
  FeatureCubitRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FeatureCubitEntity>> getFeatureCubitEntity() async {
    await Future.delayed(Duration(seconds: 2));
    return _getFeatureCubitEntity();
  }

  Future<Either<Failure, FeatureCubitEntity>> _getFeatureCubitEntity() async {
    if (await networkInfo.isConnected) {
      try {
        final model = await remoteDataSource.getFeatureCubitModel();
        return Right(FeatureCubitEntity.fromModel(model));
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.toString()));
      }
    } else {
      try {
        final model = await localDataSource.getFeatureCubitModel();
        return Right(FeatureCubitEntity.fromModel(model));
      } on LocalException catch (ex) {
        return Left(LocalFailure(ex.toString()));
      }
    }
  }
}
