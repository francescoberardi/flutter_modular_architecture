import 'package:equatable/equatable.dart';
import 'package:feature1/src/data/models/feature1_model.dart';

/// Entity class
class Feature1Entity extends Equatable {
  /// Default constructor
  Feature1Entity();

  /// Constructor that map model into entity
  factory Feature1Entity.fromModel(Feature1Model model) {
    return Feature1Entity();
  }

  @override
  List<Object> get props => [];
}
