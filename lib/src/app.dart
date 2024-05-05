import 'package:flutter/material.dart';
import 'package:tasks/src/controllers/home_controller.dart';
import 'package:tasks/src/screens/login_screen.dart';
import 'package:tasks/src/shared/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task",
      theme: themelight,
      home: const HomeController(),
    );
  }
}
