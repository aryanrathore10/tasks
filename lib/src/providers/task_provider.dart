import 'package:flutter/material.dart';
import 'package:tasks/src/model/task.dart';
import 'package:tasks/src/reporestory/task_repo.dart';

class Task_Provider extends ChangeNotifier {
  final _taskRepository = TaskRepo();
  List<Task> _tasks = [];

  List<Task> getTasks() {
    return _tasks;
  }

  void intialize() async {
    _tasks = await _taskRepository.getAllTasks();
    notifyListeners();
  }
}
