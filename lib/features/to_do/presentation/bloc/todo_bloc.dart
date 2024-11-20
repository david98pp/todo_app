import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/domain/usecases/get_tasks.dart';
import 'package:todo_app/features/to_do/domain/usecases/post_task.dart';
import 'package:todo_app/features/to_do/domain/usecases/put_task.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTasks getTasks;
  final PostTask postTask;
  final PutTask putTask;

  TodoBloc(
      {required this.getTasks, required this.postTask, required this.putTask})
      : super(Empty()) {
    on<GetTaskEvent>((event, emit) async {
      emit(Loading());
      final result = await getTasks(event);
      result.fold(
        (error) => emit(Error(error)),
        (tasks) => emit(Loaded(tasks)),
      );
    });
    on<AddTaskEvent>((event, emit) async {
      emit(Loading());
      final result = await postTask(Params(event.taskModel));
      result.fold(
        (error) => emit(Error(error)),
        (tasks) => emit(Saved()),
      );
    });
    on<UpdateTaskEvent>((event, emit) async {
      emit(Loading());
      final result = await putTask(ParamsPut(event.taskModel));
      result.fold(
        (error) => emit(Error(error)),
        (tasks) => emit(Saved()),
      );
    });
  }
}
