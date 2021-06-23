import 'package:feature1/src/data/models/feature1_model.dart';

/// Abstract class for local data source
abstract class Feature1LocalDataSource {
  /// Retrieve data
  Future<Feature1Model> getFeature1Model();
}

/// Default implementation for local data source
class Feature1LocalDataSourceImpl implements Feature1LocalDataSource {
  @override
  Future<Feature1Model> getFeature1Model() {
    return Future.value(Feature1Model());
  }
}
