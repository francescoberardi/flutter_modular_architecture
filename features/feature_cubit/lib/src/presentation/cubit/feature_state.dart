part of 'feature_cubit.dart';

/// Define abstract class for states of feature_cubit
@immutable
abstract class FeatureCubitState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Initial state
class FeatureCubitInitial extends FeatureCubitState {}

/// Loading state
class FeatureCubitLoading extends FeatureCubitState {}

/// Loaded data state
class FeatureCubitLoaded extends FeatureCubitState {
  final FeatureCubitEntity featureCubitEntity;

  FeatureCubitLoaded({required this.featureCubitEntity});

  @override
  List<Object> get props => [featureCubitEntity];
}

/// Change some data state
class FeatureCubitChangeData extends FeatureCubitState {}

/// Error state
class FeatureCubitError extends FeatureCubitState {
  final String message;

  FeatureCubitError({required this.message});

  @override
  List<Object> get props => [message];
}
