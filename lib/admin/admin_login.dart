import 'package:client/widget/support_widget.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

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
                  'Admin Panel',
                  style: AppWidget.semiboldTextFieldStyle(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Username',
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Color(0xfff4f5f9),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Username'),
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
                child: TextFormField(
                  obscureText: true,
                  controller: userPasswordController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                ),
              ),
              Center(
                child: GestureDetector(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
