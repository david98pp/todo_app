import 'package:todo_app/features/to_do/domain/entities/task.dart';

class TaskModel extends TaskOrg {
  const TaskModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  TaskModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
