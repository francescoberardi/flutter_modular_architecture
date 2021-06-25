import 'package:feature_cubit/src/domain/entities/feature_cubit_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

/// Abstract class for FeatureCubit repository
abstract class FeatureCubitRepository {
  /// Method to retrieve entity
  Future<Either<Failure, FeatureCubitEntity>> getFeatureCubitEntity();
}
