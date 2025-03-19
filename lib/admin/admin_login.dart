import 'package:client/pages/bottomnav.dart';
import 'package:client/pages/login.dart';
import 'package:client/services/database.dart';
import 'package:client/services/shared_pref.dart';
import 'package:client/widget/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? name, email, password;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void showSnackBar(BuildContext context, String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: TextStyle(fontSize: 20),
        ),
      ));
    }
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  registration() async {
    if (password != null && name != null && email != null) {
      if (!isValidEmail(email!)) {
        showSnackBar(context, 'Invalid email format!');
        return;
      }

      if (!isValidPassword(password!)) {
        showSnackBar(context, 'Password must be at least 6 characters!');
        return;
      }

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        if (mounted) {
          showSnackBar(context, 'Registered Successfully!');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomNav()));
        }

        if (userCredential.user != null) {
          await SharedPreferenceHelper().saveUserEmail(emailController.text);
          await SharedPreferenceHelper().saveUserId(userCredential.user!.uid);
          await SharedPreferenceHelper().saveUserName(nameController.text);
          await SharedPreferenceHelper().saveUserImage("");
          Map<String, dynamic> userInfoMap = {
            "Name": nameController.text,
            "Email": emailController.text,
            "Id": userCredential.user!.uid,
            "Image": ""
          };
          await DatabaseMethods()
              .addUserDetails(userInfoMap, userCredential.user!.uid);
        }
      } on FirebaseException catch (e) {
        String errorMessage = 'An error occurred. Please try again.';
        if (e.code == 'weak-password') {
          errorMessage = 'Password is too weak!';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Account already exists!';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email format!';
        }

        if (mounted) {
          showSnackBar(context, errorMessage);
        }
      } catch (e) {
        if (mounted) {
          showSnackBar(
              context, 'An unexpected error occurred. Please try again.');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Name';
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
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
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Password';
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Password'),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                        });
                      }
                      registration();
                    },
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
      ),
    );
  }
}
