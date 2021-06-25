part of 'feature_cubit.dart';

/// Define abstract class for states of feature_cubit
@immutable
abstract class FeatureCubitState {}

/// Initial state
class FeatureCubitInitial extends FeatureCubitState {}

/// Loading data state
class FeatureCubitLoading extends FeatureCubitState {}

/// Loaded data state
class FeatureCubitLoaded extends FeatureCubitState {
  final FeatureCubitEntity featureCubitEntity;

  FeatureCubitLoaded({required this.featureCubitEntity});

  @override
  List<Object> get props => [featureCubitEntity];
}

/// Change some data state in UI
class FeatureCubitChangeData extends FeatureCubitState {}

/// Error state
class FeatureCubitError extends FeatureCubitState {
  final String message;

  FeatureCubitError({required this.message});

  @override
  List<Object> get props => [message];
}
