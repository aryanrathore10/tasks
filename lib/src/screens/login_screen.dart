import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasks/src/screens/register_screen.dart';
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Required';
                            }
                            return null;
                          },
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              hintText: "Email", prefixIcon: Icon(Icons.email)),
                        ),
                        space16,
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Required';
                            }
                            return null;
                          },
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
                          onPressed: () {
                            if (emailcontroller.text.isNotEmpty &&
                                passwordcontroller.text.isNotEmpty) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim())
                                  .then((value) {
                                final user = value.user!.uid;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Loged in as $user')));
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            (error as FirebaseException)
                                                    .message ??
                                                'error')));
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
                space8,
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                    },
                    child: Text('Don not have an account, Create here')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
