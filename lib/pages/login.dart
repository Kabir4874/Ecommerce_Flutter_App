import 'package:client/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset('images/login.png'),
            Text(
              'Sign In',
              style: AppWidget.semiboldTextFieldStyle(),
            ),
            Text(
              'Please enter the details below to\n                     continue',
              style: AppWidget.lightTextFieldStyle(),
            ),
            Text(
              'Email',
              style: AppWidget.semiboldTextFieldStyle(),
            )
          ],
        ),
      ),
    );
  }
}
