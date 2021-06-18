import '../models/feature1_model.dart';

abstract class Feature1RemoteDataSource {
  Future<Feature1Model> getFeature1Model();
}

class Feature1RemoteDataSourceImpl implements Feature1RemoteDataSource {
  @override
  Future<Feature1Model> getFeature1Model() {
    return Future.value(Feature1Model());
  }
}
