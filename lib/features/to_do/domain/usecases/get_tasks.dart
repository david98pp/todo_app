import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/core/usecase/usecase.dart';
import 'package:todo_app/features/to_do/domain/entities/task.dart';
import 'package:todo_app/features/to_do/domain/repositories/tasks_repository.dart';

class GetTasks implements UseCase<List<TaskOrg>, void> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<Either<ErrorItem, List<TaskOrg>>> call(void params) async =>
      await repository.getTasks();
}
