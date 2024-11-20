import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/to_do/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/to_do/presentation/routes/routes.dart';

import 'design/text_style.dart';
import 'injection_container.dart' as dl;
import 'injection_container.dart';

void main() {
  dl.init();
  runApp(
    BlocProvider<TodoBloc>(
      create: (context) => sl<TodoBloc>()..add(GetTaskEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TODO APP',
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      routerConfig: appRouter,
    );
  }
}
