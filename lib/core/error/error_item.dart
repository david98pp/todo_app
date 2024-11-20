import 'package:equatable/equatable.dart';

abstract class ErrorItem extends Equatable {
  final List properties;

  const ErrorItem([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

class ServerError extends ErrorItem {}

class ConnectivityError extends ErrorItem {}

class DataError extends ErrorItem {
  final String message;

  DataError(this.message) : super([message]);
}
