import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasks/src/shared/spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  "We like remanding things",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text('Create an account'),
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
                        'Create',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      space16,
                      IconButton.filled(
                          iconSize: 32,
                          style: IconButton.styleFrom(
                              minimumSize: const Size(56, 56)),
                          onPressed: () {
                            if (emailcontroller.text.isNotEmpty &&
                                passwordcontroller.text.isNotEmpty) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim())
                                  .then((value) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Account Created!!!')));
                              }).catchError((error) {
                                final firebaseError =
                                    error as FirebaseException;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            firebaseError.message ?? 'Error')));
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Email and Password is required')));
                            }
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Already have an account, Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
