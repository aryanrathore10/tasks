import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/src/controllers/home_controller.dart';
import 'package:tasks/src/providers/task_provider.dart';
import 'package:tasks/src/shared/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Task_Provider>(
      create: (context) => Task_Provider(),
      child: MaterialApp(
        title: "Task",
        theme: themelight,
        home: const HomeController(),
      ),
    );
  }
}
