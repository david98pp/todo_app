import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/domain/entities/task.dart';
import 'package:todo_app/features/to_do/domain/repositories/tasks_repository.dart';

class PostTask implements UseCase<bool, Params> {
  final TaskRepository repository;

  PostTask(this.repository);

  @override
  Future<Either<ErrorItem, bool>> call(Params params) async =>
      await repository.postTask(params.taskModel);
}


class Params extends Equatable {
  final TaskModel taskModel;

  const Params(this.taskModel);

  @override
  List<Object?> get props => [taskModel];
}
