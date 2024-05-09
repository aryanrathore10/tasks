import 'package:flutter/material.dart';

@immutable
class Task {
  final String title;
  final bool isDone;
  final String description;

  const Task(
      {required this.title, this.isDone = false, required this.description});

  static Task fromMap(Map<String, dynamic> data) {
    return Task(
        title: data['title'],
        isDone: data["isDone"],
        description: data['description']);
  }
}
