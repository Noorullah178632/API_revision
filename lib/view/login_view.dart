import 'package:api_revision/resources/component/rounded_button.dart';
import 'package:api_revision/utils/utils.dart';
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
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
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
                    focusNode: emailNode,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.moveFocusNode(context, passwordNode);
                    },
                    validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  ),
                  SizedBox(height: 15),
                  // Password
                  ValueListenableBuilder<bool>(
                    valueListenable: _obsecureText,
                    builder: (context, isObsecure, child) {
                      return TextFormField(
                        focusNode: passwordNode,
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
                        onFieldSubmitted: (value) {},
                        validator: (value) =>
                            value!.length < 6 ? 'Too short' : null,
                      );
                    },
                  ),
                  SizedBox(height: height * .1),
                  RoundedButton(text: "Login", onpress: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
