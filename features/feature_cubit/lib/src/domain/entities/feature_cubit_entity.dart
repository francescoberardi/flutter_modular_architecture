import 'package:equatable/equatable.dart';
import 'package:feature_cubit/src/data/models/feature_cubit_model.dart';

/// Entity class
class FeatureCubitEntity extends Equatable {
  /// Default constructor
  FeatureCubitEntity();

  /// Constructor that map model into entity
  factory FeatureCubitEntity.fromModel(FeatureCubitModel model) {
    return FeatureCubitEntity();
  }

  @override
  List<Object> get props => [];
}
