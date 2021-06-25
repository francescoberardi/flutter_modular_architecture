import 'package:equatable/equatable.dart';
import 'package:feature1/src/domain/entities/feature1_entity.dart';

/// Base state class for feature1
abstract class Feature1State extends Equatable {
  @override
  List<Object> get props => [];
}

/// Feature1 bloc empty state class
class Empty extends Feature1State {}

/// Feature1 bloc loading state class
class Loading extends Feature1State {}

/// Feature1 bloc loaded state class
class Loaded extends Feature1State {
  /// Entity property
  final Feature1Entity feature1entity;

  /// Default constructor
  Loaded({required this.feature1entity});

  @override
  List<Object> get props => [feature1entity];
}

/// Feature1 bloc error state class
class Error extends Feature1State {
  /// Error message property
  final String message;

  /// Default constructor
  Error({required this.message});

  @override
  List<Object> get props => [message];
}
