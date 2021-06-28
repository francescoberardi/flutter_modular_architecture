import 'package:feature_cubit/src/data/datasources/feature_cubit_local_data_source.dart';
import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';
import 'package:flutter_test/flutter_test.dart';

/// Initial test for FeatureCubitLocalDataSourceImpl class
void main() {
  late FeatureCubitLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = FeatureCubitLocalDataSourceImpl();
  });

  test('should return FeatureCubit data', () async {
    final result = await dataSource.getFeatureCubitModel();

    expect(result, isA<FeatureCubitModel>());
  });
}
