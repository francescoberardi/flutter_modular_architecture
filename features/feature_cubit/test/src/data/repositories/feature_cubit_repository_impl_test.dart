import 'package:feature_cubit/src/domain/entities/feature_cubit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';
import 'package:feature_cubit/src/data/datasources/feature_cubit_local_data_source.dart';
import 'package:feature_cubit/src/data/datasources/feature_cubit_remote_data_source.dart';
import 'package:feature_cubit/src/data/repositories/feature_cubit_repository_impl.dart';

class MockLocalDataSourceImpl extends Mock
    implements FeatureCubitLocalDataSourceImpl {}

class MockRemoteDataSourceImpl extends Mock
    implements FeatureCubitRemoteDataSourceImpl {}

class MockNetworkInfoImpl extends Mock implements NetworkInfoImpl {
  @override
  Future<bool> get isConnected =>
      super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future.value(true));
}

void main() {
  late FeatureCubitRepositoryImpl repository;
  late MockLocalDataSourceImpl mockLocalDataSource;
  late MockRemoteDataSourceImpl mockRemoteDataSource;
  late MockNetworkInfoImpl mockNetworkInfoImpl;

  setUp(() {
    mockLocalDataSource = MockLocalDataSourceImpl();
    mockRemoteDataSource = MockRemoteDataSourceImpl();
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
            .thenAnswer((_) async => Future.value(true));
      });

      callBack();
    });
  }

  group('getFeatureCubitEntity', () {
    testsOnline(() {
      test(
          'should return remote data when the call to remote data is successful',
          () async {
        final result = await repository.getFeatureCubitEntity();

        expect(result, isA<FeatureCubitEntity>());
      });
    });
  });
}
