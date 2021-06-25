import 'package:feature_cubit/src/data/datasources/feature_cubit_remote_data_source.dart';
import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';
import 'package:flutter_test/flutter_test.dart';

/// Initial test for FeatureCubitLocalDataSourceImpl class
void main() {
  late FeatureCubitRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = FeatureCubitRemoteDataSourceImpl();
  });

  test('should return FeatureCubit data', () async {
    final result = await dataSource.getFeatureCubitModel();

    expect(result, isA<FeatureCubitModel>());
  });
}
