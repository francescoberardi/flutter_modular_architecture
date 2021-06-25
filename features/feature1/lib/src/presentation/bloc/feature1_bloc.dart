import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared/shared.dart';

import './bloc.dart';
import '../../domain/usecases/feature1_usecase.dart';

/// Feature1 Bloc
class Feature1Bloc extends Bloc<Feature1Event, Feature1State> {
  /// Feature1 use case property
  final Feature1UseCase feature1UseCase;

  /// Default constructor
  Feature1Bloc({
    required this.feature1UseCase,
  }) : super(Empty());

  @override
  Stream<Feature1State> mapEventToState(Feature1Event event) async* {
    if (event is LoadFeature1Entity) {
      yield* _mapLoadFeature1EntityToState(event);
    }
  }

  Stream<Feature1State> _mapLoadFeature1EntityToState(
    LoadFeature1Entity event,
  ) async* {
    yield Loading();
    final failureOrEntity = await feature1UseCase(NoParams());
    yield failureOrEntity.match(
      (failure) => Error(message: failure.message),
      (entity) => Loaded(feature1entity: entity),
    );
  }
}
