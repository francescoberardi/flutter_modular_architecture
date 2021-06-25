import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';

/// Abstract class for local data source
abstract class FeatureCubitRemoteDataSource {
  /// Define method
  Future<FeatureCubitModel> getFeatureCubitModel();
}

/// Default implementation for local data source
class FeatureCubitRemoteDataSourceImpl implements FeatureCubitRemoteDataSource {
  @override
  Future<FeatureCubitModel> getFeatureCubitModel() {
    return Future.value(FeatureCubitModel());
  }
}
