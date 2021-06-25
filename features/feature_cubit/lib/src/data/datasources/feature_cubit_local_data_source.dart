import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';

/// Abstract class for local data source
abstract class FeatureCubitLocalDataSource {
  /// Define method(s)
  Future<FeatureCubitModel> getFeatureCubitModel();
}

/// Default implementation for local data source
class FeatureCubitLocalDataSourceImpl implements FeatureCubitLocalDataSource {
  @override
  Future<FeatureCubitModel> getFeatureCubitModel() {
    return Future.value(FeatureCubitModel());
  }
}
