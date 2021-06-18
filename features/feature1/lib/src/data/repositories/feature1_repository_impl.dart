import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../../domain/entities/feature1_entity.dart';
import '../../domain/repositories/feature1_repository.dart';
import '../datasources/feature1_local_data_source.dart';
import '../datasources/feature1_remote_data_source.dart';

class Feature1RepositoryImpl implements Feature1Repository {
  final Feature1LocalDataSource remoteDataSource;
  final Feature1RemoteDataSource localDataSource;
  final NetworkInfo networkInfo;

  Feature1RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Feature1Entity>> getFeature1Entity() async {
    await Future.delayed(Duration(seconds: 1));
    return _getFeature1Entity();
  }

  Future<Either<Failure, Feature1Entity>> _getFeature1Entity() async {
    if (await networkInfo.isConnected) {
      try {
        final model = await remoteDataSource.getFeature1Model();
        return Right(Feature1Entity.fromModel(model));
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.toString()));
      }
    } else {
      try {
        final model = await localDataSource.getFeature1Model();
        return Right(Feature1Entity.fromModel(model));
      } on LocalException catch (ex) {
        return Left(LocalFailure(ex.toString()));
      }
    }
  }
}
