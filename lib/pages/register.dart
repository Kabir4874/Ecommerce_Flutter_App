import 'package:client/pages/login.dart';
import 'package:client/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/login.png'),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Sign Up',
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
                'Name',
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
                      border: InputBorder.none, hintText: 'Name'),
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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'SIGN UP',
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
                    "Already have an account?",
                    style: AppWidget.lightTextFieldStyle(),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
