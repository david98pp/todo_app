import 'package:go_router/go_router.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/presentation/pages/home_page.dart';
import 'package:todo_app/features/to_do/presentation/pages/new_task_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) {
            TaskModel? taskModel = state.extra as TaskModel?;
            return NewTaskPage(
              existingTask: taskModel,
            );
          },
        )
      ],
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
