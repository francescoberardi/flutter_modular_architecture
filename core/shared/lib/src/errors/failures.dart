import 'package:equatable/equatable.dart';

/// Base class for all types of failures
abstract class Failure extends Equatable {
  /// failure message
  final String message;

  /// Default constructor
  Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Server failure
class ServerFailure extends Failure {
  /// Default constructor
  ServerFailure(String message) : super(message);
}

/// Local failure
class LocalFailure extends Failure {
  /// Default constructor
  LocalFailure(String message) : super(message);
}
