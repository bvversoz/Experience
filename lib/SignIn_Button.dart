import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInButton extends StatelessWidget {
  final String email;
  final String password;

  const SignInButton({
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () {
        if (email.isEmpty || password.isEmpty) {
          Fluttertoast.showToast(
            msg: 'Please enter your email and password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        } else if (!emailRegex.hasMatch(email)) {
          Fluttertoast.showToast(
            msg: 'Please enter a valid email address',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.orange,
            textColor: Colors.white,
          );
        } else if (password.length < 8) {
          Fluttertoast.showToast(
            msg: 'Password must be at least 8 characters long',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.yellow,
            textColor: Colors.black,
          );
        } else if (password.toLowerCase() == 'password') {
          Fluttertoast.showToast(
            msg: 'Please choose a stronger password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        } else {
          Fluttertoast.showToast(
            msg: 'Welcome, $email!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
          );
        }
      },
      child: Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
