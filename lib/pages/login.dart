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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/login.png'),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Sign In',
                style: AppWidget.semiboldTextFieldStyle(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Please enter the details below to\n                     continue',
                style: AppWidget.lightTextFieldStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: AppWidget.semiboldTextFieldStyle(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Color(0xfff4f5f9),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Email'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
