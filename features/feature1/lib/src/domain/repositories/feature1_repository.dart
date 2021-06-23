import 'package:feature1/src/domain/entities/feature1_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

/// Abstract class for Feature1 repository
abstract class Feature1Repository {
  /// Method to retrieve entity
  Future<Either<Failure, Feature1Entity>> getFeature1Entity();
}
