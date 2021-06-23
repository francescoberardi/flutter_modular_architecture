import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

import '../entities/feature1_entity.dart';
import '../repositories/feature1_repository.dart';

/// Use case for feature1
class Feature1UseCase implements UseCase<Feature1Entity, NoParams> {
  /// Feature1 repository property
  final Feature1Repository repository;

  /// Default constructor
  Feature1UseCase({required this.repository});

  @override
  Future<Either<Failure, Feature1Entity>> call(NoParams params) async {
    return await repository.getFeature1Entity();
  }
}

/// Params class for feature1 use case
class Params extends Equatable {
  @override
  List<Object> get props => [];
}
