import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/domain/entities/task.dart';
import 'package:todo_app/features/to_do/domain/repositories/tasks_repository.dart';

class PutTask implements UseCase<bool, ParamsPut> {
  final TaskRepository repository;

  PutTask(this.repository);

  @override
  Future<Either<ErrorItem, bool>> call(ParamsPut params) async =>
      await repository.putTask(params.taskModel);
}


class ParamsPut extends Equatable {
  final TaskModel taskModel;

  const ParamsPut(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}
