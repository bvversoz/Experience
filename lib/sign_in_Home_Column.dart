import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SignIn_Button.dart';
import 'TextField_Email.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Card(
        color: Colors.black26,
        elevation: 4,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: 'Enter your email',
                labelText: 'Email',
                icon: Icons.email,
                controller: emailController,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: 'Enter your password',
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: true,
                controller: passwordController,
              ),
            ),
            SizedBox(height: 20),
            SignInButton(email: emailController.value.text, password: passwordController.value.text,),
          ],
        ),
      ),
    );
  }
}
