import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/design/tokens/td_colors.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:todo_app/features/to_do/presentation/bloc/todo_bloc.dart';

class NewTaskPage extends StatelessWidget {
  final TaskModel? existingTask;

  const NewTaskPage({super.key, this.existingTask});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController(
      text: existingTask?.title ?? '',
    );
    final TextEditingController descriptionController = TextEditingController(
      text: existingTask?.description ?? '',
    );

    void submitTask() {
      if (formKey.currentState!.validate()) {
        if (existingTask != null) {
          final updatedTask = existingTask!.copyWith(
            title: titleController.text,
            description: descriptionController.text,
          );
          context.read<TodoBloc>().add(UpdateTaskEvent(updatedTask));
        } else {
          final newTask = TaskModel(
            title: titleController.text,
            description: descriptionController.text,
            id: null,
          );
          context.read<TodoBloc>().add(AddTaskEvent(newTask));
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(existingTask != null ? 'Editar Tarea' : 'Nueva Tarea'),
          centerTitle: true,
        ),
        body: BlocListener<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Hubo un error, por favor inténtelo más tarde'),
                ),
              );
            } else if (state is Saved) {
              context.read<TodoBloc>().add(GetTaskEvent());
              context.pop();
            }
          },
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Título',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa un título';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descripción',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: submitTask,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: TdColors.brandPrimary_0,
                          ),
                          child: Text(
                            existingTask != null
                                ? 'Actualizar Tarea'
                                : 'Guardar Tarea',
                            style:
                                const TextStyle(color: TdColors.brandPrimary_1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
