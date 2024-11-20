part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final List properties;

  const TodoState([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

class Empty extends TodoState {}

class Loading extends TodoState {}

class Saved extends TodoState {}

class Loaded<T> extends TodoState {
  final T data;

  Loaded(this.data) : super([data]);

  @override
  List<Object?> get props => [data];
}

class Error extends TodoState {
  final ErrorItem error;

  Error(this.error) : super([error]);
}
