import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/features/to_do/data/datasources/tasks_source.dart';
import 'package:todo_app/features/to_do/data/repositories/tasks_api.dart';
import 'package:todo_app/features/to_do/domain/repositories/tasks_repository.dart';
import 'package:todo_app/features/to_do/domain/usecases/get_tasks.dart';
import 'package:todo_app/features/to_do/domain/usecases/post_task.dart';
import 'package:todo_app/features/to_do/domain/usecases/put_task.dart';
import 'package:todo_app/features/to_do/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

void init() {
  initFeatures();
  initExternals();
}

void initFeatures() {
  // Bloc
  sl.registerFactory(
    () => TodoBloc(getTasks: sl(),postTask: sl(),putTask: sl()),
  );

// Uses cases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => PostTask(sl()));
  sl.registerLazySingleton(() => PutTask(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskApi(
      tasksRemoteDataSource: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<TasksRemoteDataSource>(
    () => TasksRemoteDataSourceImpl(sl()),
  );
}

void initExternals() {
  sl.registerLazySingleton(() => http.Client());
}
