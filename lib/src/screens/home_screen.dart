import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/src/providers/task_provider.dart';
import 'package:tasks/src/widgets/add_task_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Task_Provider>(context, listen: false).intialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tasks",
          ),
        ),
        body: Consumer<Task_Provider>(builder: (context, data, child) {
          final tasks = data.getTasks();
          return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: tasks[index].isDone,
                  onChanged: (v) {},
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].description),
                );
              });
        }),
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
