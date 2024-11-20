import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/domain/entities/task.dart';

abstract class TaskRepository{
  Future<Either<ErrorItem,List<TaskOrg>>> getTasks();
  Future<Either<ErrorItem,bool>> postTask(TaskModel taskModel);
  Future<Either<ErrorItem,bool>> putTask(TaskModel taskModel);
}