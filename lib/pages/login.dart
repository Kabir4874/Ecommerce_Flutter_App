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
            ),
            SizedBox(height: 20),
            Text(
              'Password',
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
                    border: InputBorder.none, hintText: 'Password'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppWidget.lightTextFieldStyle(),
                ),
                SizedBox(width: 10),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
