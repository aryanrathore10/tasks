import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Task {
  final String id;
  final String title;
  final bool isDone;
  final String description;

  const Task(
      {required this.id,
      required this.title,
      required this.isDone,
      required this.description});

  factory Task.newTask({required String title, required String description}) {
    return Task(
        title: title, isDone: false, description: description, id: Uuid().v1());
  }

  static Task fromMap(Map<String, dynamic> data) {
    return Task(
        id: data['id'],
        title: data['title'],
        isDone: data["isDone"],
        description: data['description']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  Task copyWith(
      {String? id, String? title, bool? isDone, String? description}) {
    return Task(
      description: description ?? this.description,
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
    );
  }
}
