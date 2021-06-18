import 'package:dartz/dartz.dart';
import 'package:feature1/src/domain/entities/feature1_entity.dart';
import 'package:shared/shared.dart';

abstract class Feature1Repository {
  Future<Either<Failure, Feature1Entity>> getFeature1Entity();
}
