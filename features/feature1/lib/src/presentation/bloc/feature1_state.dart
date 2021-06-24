import 'package:equatable/equatable.dart';
import 'package:feature1/src/domain/entities/feature1_entity.dart';

/// Base state class for feature1
abstract class Feature1State extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends Feature1State {}

class Loading extends Feature1State {}

class Loaded extends Feature1State {
  final Feature1Entity feature1entity;

  Loaded({required this.feature1entity});

  @override
  List<Object> get props => [feature1entity];
}

class Error extends Feature1State {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
