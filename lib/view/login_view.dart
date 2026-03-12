import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  ),
                  SizedBox(height: 15),
                  // Password
                  ValueListenableBuilder<bool>(
                    valueListenable: _obsecureText,
                    builder: (context, isObsecure, child) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: isObsecure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _obsecureText.value = !_obsecureText.value;
                            },
                            child: Icon(
                              _obsecureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value!.length < 6 ? 'Too short' : null,
                      );
                    },
                  ),
                  SizedBox(height: height * .1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
