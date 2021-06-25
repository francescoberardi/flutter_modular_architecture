import 'package:bloc/bloc.dart';
import 'package:feature_cubit/src/domain/entities/feature_cubit_entity.dart';
import 'package:meta/meta.dart';
import 'package:feature_cubit/src/domain/usecases/feature_cubit_usecases.dart';
import 'package:shared/shared.dart';

part 'feature_state.dart';

/// Define cubit class
class FeatureCubit extends Cubit<FeatureCubitState> {
  final FeatureCubitUseCase useCase;

  /// Default constructor with initial state
  FeatureCubit({required this.useCase}) : super(FeatureCubitInitial());

  /// Some method(s) for work with data. With Cubit pattern we don`t use events.
  void getFeatureCubitEntitiesToState() async {
    emit(FeatureCubitLoading());
    final failureOrEntity = await useCase(NoParams());
    failureOrEntity.match(
      (failure) => emit(FeatureCubitError(message: failure.message)),
      (entity) => emit(FeatureCubitLoaded(featureCubitEntity: entity)),
    );
  }
}
