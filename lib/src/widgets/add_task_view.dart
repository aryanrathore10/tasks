import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/src/model/task.dart';
import 'package:tasks/src/providers/task_provider.dart';
import 'package:tasks/src/shared/spacing.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Form(
        key: formkey,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Title'),
            validator: (value) {
              if (value!.isEmpty) {
                return "Title Can't be Empty";
              }
              return null;
            },
            controller: titleController,
          ),
          space16,
          TextFormField(
            minLines: 4,
            maxLines: 4,
            decoration: InputDecoration(hintText: 'Description'),
            validator: (value) {
              if (value!.isEmpty) {
                return "Decription Can't be Empty";
              }
              return null;
            },
            controller: descriptionController,
          ),
          space16,
          FilledButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  final Task task = Task.newTask(
                      title: titleController.text.trim(),
                      description: descriptionController.text.trim());
                  Provider.of<Task_Provider>(context, listen: false)
                      .addTask(task);
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add")),
        ]));
  }
}
