import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

import '../entities/feature_cubit_entity.dart';
import '../repositories/feature_cubit_repository.dart';

/// Use case for FeatureCubit
class FeatureCubitUseCase implements UseCase<FeatureCubitEntity, NoParams> {
  /// FeatureCubit repository property
  final FeatureCubitRepository repository;

  /// Default constructor
  FeatureCubitUseCase({required this.repository});

  @override
  Future<Either<Failure, FeatureCubitEntity>> call(NoParams params) async {
    return await repository.getFeatureCubitEntity();
  }
}

/// Params class for featureCubit use case
class Params extends Equatable {
  @override
  List<Object> get props => [];
}
