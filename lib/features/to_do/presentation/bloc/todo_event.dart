part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTaskEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TodoEvent {
  final TaskModel taskModel;

  const AddTaskEvent(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}

class UpdateTaskEvent extends TodoEvent {
  final TaskModel taskModel;

  const UpdateTaskEvent(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}

class DeleteTaskEvent extends TodoEvent {
  final int taskId;

  const DeleteTaskEvent(this.taskId);

  @override
  List<Object?> get props => [taskId];
}
