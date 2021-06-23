import 'package:equatable/equatable.dart';

/// The base class for the Params of all use cases
abstract class BaseParams extends Equatable {}

/// The default class for empty params of use cases
class NoParams extends BaseParams {
  @override
  List<Object?> get props => [];
}
