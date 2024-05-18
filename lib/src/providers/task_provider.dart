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

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _updateTask();
    notifyListeners();
  }

  Future<void> _updateTask() async {
    await _taskRepository.updateTaskList(_tasks);
  }

  Future<void> changeStatus(String id, bool status) async {
    final currentTask = _tasks.where((element) => element.id == id).first;
    final Task updatedTask = currentTask.copyWith(isDone: status);

    int index = _tasks.indexOf(currentTask);
    _tasks.removeAt(index);
    _tasks.insert(index, updatedTask);
    await _updateTask();
    notifyListeners();
  }
}
