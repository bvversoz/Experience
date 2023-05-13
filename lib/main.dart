import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SignIn_Button.dart';
import 'TextField_Email.dart';
import 'sign_in_Home_Column.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign-In Example',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Sign-In Example'),
        // ),
        body: Center(
          child: SignInForm(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ),
      ),
    );
  }
}
