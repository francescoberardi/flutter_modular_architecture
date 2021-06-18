import 'package:equatable/equatable.dart';
import 'package:feature1/src/data/models/feature1_model.dart';

class Feature1Entity extends Equatable {
  Feature1Entity();

  factory Feature1Entity.fromModel(Feature1Model model) {
    return Feature1Entity();
  }

  @override
  List<Object> get props => [];
}
