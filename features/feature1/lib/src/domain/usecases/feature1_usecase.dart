import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

import '../entities/feature1_entity.dart';
import '../repositories/feature1_repository.dart';

class Feature1UseCase implements UseCase<Feature1Entity, Params> {
  final Feature1Repository repository;

  Feature1UseCase({required this.repository});

  @override
  Future<Either<Failure, Feature1Entity>> call(Params params) async {
    return await repository.getFeature1Entity();
  }
}

class Params extends Equatable {
  @override
  List<Object> get props => [];
}
