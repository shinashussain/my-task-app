// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/authentication/view/Sign_Up_Page.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  // thext editing controllers the email controller and passwordcontroller
  final TextEditingController _loginemailcontroller = TextEditingController();

  final TextEditingController _loginpasswordcontroller =
      TextEditingController();

  // login function
  Future<void> loginwithemail() async {
    try {
      await Authentication().Login(_loginemailcontroller.text.trim(),
          _loginpasswordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        String? errormassage = e.message;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$errormassage')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 214.h,
              ),
              Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.rubik(
                    fontSize: 36.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 68.h,
              ),
              TextField(
                controller: _loginemailcontroller,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 46.h,
              ),
              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _loginpasswordcontroller,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 46.h,
              ),
              SizedBox(
                  height: 38.h,
                  width: 116.w,
                  child: ElevatedButton(
                    onPressed: () {
                      loginwithemail();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black12),
                    child: Text(
                      'login',
                      style: GoogleFonts.rubik(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  )),
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Dont have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Text('Sign up',
                            style: TextStyle(color: Colors.blue)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginemailcontroller.dispose();
    _loginpasswordcontroller.dispose();
    super.dispose();
  }
}
