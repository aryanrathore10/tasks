import 'package:flutter/material.dart';

@immutable
class Task {
  final String title;
  final bool isDone;
  final String description;

  const Task(
      {required this.title, required this.isDone, required this.description});

  factory Task.newTask({required String title, required String description}) {
    return Task(title: title, isDone: false, description: description);
  }

  static Task fromMap(Map<String, dynamic> data) {
    return Task(
        title: data['title'],
        isDone: data["isDone"],
        description: data['description']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,

    };
  }
}
