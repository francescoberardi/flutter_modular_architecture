import '../models/feature1_model.dart';

/// Abstract class for remote data source
abstract class Feature1RemoteDataSource {
  /// Retrieve data
  Future<Feature1Model> getFeature1Model();
}

/// Default implementation for remote data source
class Feature1RemoteDataSourceImpl implements Feature1RemoteDataSource {
  @override
  Future<Feature1Model> getFeature1Model() {
    return Future.value(Feature1Model());
  }
}
