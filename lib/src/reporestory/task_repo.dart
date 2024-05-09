import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/src/model/task.dart';

class TaskRepo {
  final _taskCollection = FirebaseFirestore.instance.collection('tasks');
  Future<List<Task>> getAllTasks() async {
    final data = (await _taskCollection.doc('npo7ucj6rmmMJ8Cfcrq3').get());
    final tasks = data.data()!['tasks'];
    final List<Task> res = [];
    for (Map<String, dynamic> e in tasks) {
      res.add(Task.fromMap(e));
    }
    return res;
  }
}
