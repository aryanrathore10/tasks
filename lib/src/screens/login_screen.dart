import 'package:flutter/material.dart';
import 'package:tasks/src/shared/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google-tasks.png',
                  height: 170,
                ),
                space16,
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text('Login to your account'),
                space16,
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              hintText: "Email", prefixIcon: Icon(Icons.email)),
                        ),
                        space16,
                        TextFormField(
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock)),
                        )
                      ],
                    )),
                space16,
                space16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      space16,
                      IconButton.filled(
                          iconSize: 32,
                          style: IconButton.styleFrom(
                              minimumSize: const Size(56, 56)),
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
