import 'package:feature1/src/data/models/feature1_model.dart';

abstract class Feature1LocalDataSource {
  Future<Feature1Model> getFeature1Model();
}

class Feature1LocalDataSourceImpl implements Feature1LocalDataSource {
  @override
  Future<Feature1Model> getFeature1Model() {
    return Future.value(Feature1Model());
  }
}
