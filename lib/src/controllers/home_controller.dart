import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasks/src/screens/home_screen.dart';
import 'package:tasks/src/screens/login_screen.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.userChanges();
    return StreamBuilder(
        stream: User,
        builder: ((context, snapshot) {
          if (snapshot.data != null) {
            return HomeScreen();
          }
          return LoginScreen();
        }));
  }
}
