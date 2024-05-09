import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasks/src/reporestory/task_repo.dart';
import 'package:tasks/src/widgets/add_task_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TaskRepo.getAllTasks();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tasks",
          ),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text('Log Out')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: Theme.of(context).colorScheme.background,
                showDragHandle: true,
                context: context,
                builder: (context) => Container(
                      padding: EdgeInsets.all(24),
                      child: AddTaskView(),
                    ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
