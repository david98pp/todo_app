import 'dart:convert';

import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/features/to_do/data/models/task_model.dart';
import 'package:http/http.dart' as http;

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();

  Future<bool> addTask(TaskModel taskModel);

  Future<bool> editTask(TaskModel taskModel);
}

class TasksRemoteDataSourceImpl implements TasksRemoteDataSource {
  final http.Client client;

  TasksRemoteDataSourceImpl(this.client);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final taskResponse = await client.get(
        Uri.parse('http://10.0.2.2:8000/tasks/'),
      );
      final tasksList = json.decode(utf8.decode(taskResponse.bodyBytes));

      if (taskResponse.statusCode == 200) {
        return (tasksList as List).map((e) => TaskModel.fromJson(e)).toList();
      } else {
        throw ServerException(taskResponse);
      }
    } catch (e) {
      throw ServerException(null);
    }
  }

  @override
  Future<bool> addTask(TaskModel taskModel) async {
    try {
      final taskResponse = await client.post(
        Uri.parse('http://10.0.2.2:8000/tasks/'),
        body: json.encode(taskModel.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (taskResponse.statusCode == 201) {
        return true;
      } else {
        throw ServerException(taskResponse);
      }
    } catch (e) {
      throw ServerException(null);
    }
  }

  @override
  Future<bool> editTask(TaskModel taskModel) async {
    try {
      final taskResponse = await client.put(
        Uri.parse('http://10.0.2.2:8000/tasks/${taskModel.id}/'),
        body: json.encode(taskModel.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (taskResponse.statusCode == 200) {
        return true;
      } else {
        throw ServerException(taskResponse);
      }
    } catch (e) {
      throw ServerException(null);
    }
  }
}
