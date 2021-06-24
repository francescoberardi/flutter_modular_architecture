import 'package:equatable/equatable.dart';

/// Base Feature1 event
abstract class Feature1Event extends Equatable {
  @override
  List<Object> get props => [];
}

/// Feature1 Entity load event
class LoadFeature1Entity extends Feature1Event {
  @override
  List<Object> get props => [];
}
