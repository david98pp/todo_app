import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/error_item.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/features/to_do/data/datasources/tasks_source.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/domain/entities/task.dart';
import 'package:todo_app/features/to_do/domain/repositories/tasks_repository.dart';

class TaskApi implements TaskRepository {
  final TasksRemoteDataSource tasksRemoteDataSource;

  TaskApi({required this.tasksRemoteDataSource});

  @override
  Future<Either<ErrorItem, List<TaskOrg>>> getTasks() async {
    try {
      return Right(await tasksRemoteDataSource.getTasks());
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<ErrorItem, bool>> postTask(TaskModel taskModel) async {
    try {
      return Right(await tasksRemoteDataSource.addTask(taskModel));
    } on ServerException {
      return Left(ServerError());
    }
  }
  @override
  Future<Either<ErrorItem, bool>> putTask(TaskModel taskModel) async {
    try {
      return Right(await tasksRemoteDataSource.editTask(taskModel));
    } on ServerException {
      return Left(ServerError());
    }
  }
}
