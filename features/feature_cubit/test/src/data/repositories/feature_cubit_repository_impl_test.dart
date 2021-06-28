import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:feature_cubit/src/domain/entities/feature_cubit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';
import 'package:feature_cubit/src/data/datasources/feature_cubit_local_data_source.dart';
import 'package:feature_cubit/src/data/datasources/feature_cubit_remote_data_source.dart';
import 'package:feature_cubit/src/data/repositories/feature_cubit_repository_impl.dart';

import 'feature_cubit_repository_impl_test.mocks.dart';

/// Initial test for FeatureCubitRepositoryImpl class
@GenerateMocks([
  FeatureCubitRemoteDataSourceImpl,
  FeatureCubitLocalDataSourceImpl,
  NetworkInfoImpl
])
void main() {
  late FeatureCubitRepositoryImpl repository;
  late MockFeatureCubitLocalDataSourceImpl mockLocalDataSource;
  late MockFeatureCubitRemoteDataSourceImpl mockRemoteDataSource;
  late MockNetworkInfoImpl mockNetworkInfoImpl;

  setUp(() {
    mockLocalDataSource = MockFeatureCubitLocalDataSourceImpl();
    mockRemoteDataSource = MockFeatureCubitRemoteDataSourceImpl();
    mockNetworkInfoImpl = MockNetworkInfoImpl();
    repository = FeatureCubitRepositoryImpl(
        localDataSource: mockLocalDataSource,
        remoteDataSource: mockRemoteDataSource,
        networkInfo: mockNetworkInfoImpl);
  });

  void testsOnline(Function callBack) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfoImpl.isConnected)
            .thenAnswer((_) => Future.value(true));
      });

      callBack();
    });
  }

  void testsOffline(Function callBack) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfoImpl.isConnected)
            .thenAnswer((_) => Future.value(false));
      });

      callBack();
    });
  }

  group('getFeatureCubitEntity', () {
    FeatureCubitModel tCubitData = FeatureCubitModel();

    testsOnline(() {
      test(
          'should return remote data when the call to remote data is successful',
          () async {
        when(mockRemoteDataSource.getFeatureCubitModel())
            .thenAnswer((_) => Future.value(tCubitData));

        final result = await repository.getFeatureCubitEntity();

        expect(result, Right(FeatureCubitEntity.fromModel(tCubitData)));
      });

      test(
          'should return server failure when the call to remote data is unsuccessful',
          () async {
        when(mockRemoteDataSource.getFeatureCubitModel())
            .thenThrow(ServerException());

        final result = await repository.getFeatureCubitEntity();

        expect(result, Left(ServerFailure(ServerException().toString())));
      });
    });

    testsOffline(() {
      test('should return local data when the call to local data is successful',
          () async {
        when(mockLocalDataSource.getFeatureCubitModel())
            .thenAnswer((_) => Future.value(tCubitData));

        final result = await repository.getFeatureCubitEntity();

        expect(result, Right(FeatureCubitEntity.fromModel(tCubitData)));
      });

      test(
          'should return local failure when the call to local data is unsuccessful',
          () async {
        when(mockLocalDataSource.getFeatureCubitModel())
            .thenThrow(LocalException());

        final result = await repository.getFeatureCubitEntity();

        expect(result, Left(LocalFailure(LocalException().toString())));
      });
    });
  });
}
