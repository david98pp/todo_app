import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/design/text_style.dart';
import 'package:todo_app/design/tokens/td_colors.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/presentation/bloc/todo_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.watch<TodoBloc>();
    List<TaskModel> listTask = List.empty(growable: true);
    if (todoBloc.state is Loaded) {
      listTask = todoBloc.state.props[0] as List<TaskModel>;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO APP',
          style: textTheme.displayMedium,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          todoBloc.state is Loaded
              ? IconButton(
                  icon: const Icon(Icons.bar_chart),
                  onPressed: () {},
                )
              : Container(),
        ],
      ),
      body: SafeArea(
        child: todoBloc.state is Loaded
            ? ListView.builder(
                itemCount: listTask.length,
                itemBuilder: (context, index) {
                  final task = listTask[index];
                  return Dismissible(
                    key: Key(task.id.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<TodoBloc>().add(DeleteTaskEvent(task.id!));
                    },
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: task.description.isNotEmpty
                            ? Text(
                                task.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : null,
                        onTap: () {
                          context.push('/new', extra: task);
                        },
                      ),
                    ),
                  );
                },
              )
            : todoBloc.state is Loading
                ? const Center(child: CircularProgressIndicator())
                : const Center(
                    child: Text(
                      'Hubo un error al cargar las tareas, por favor inténtelo mas tarde',
                    ),
                  ),
      ),
      floatingActionButton: todoBloc.state is Loaded
          ? FloatingActionButton(
              onPressed: () => context.go('/new'),
              child: const Icon(
                Icons.add,
                color: TdColors.brandPrimary_1,
              ),
            )
          : null,
    );
  }
}
