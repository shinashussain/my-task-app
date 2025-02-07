import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // two texteditingcontrollers for signupemail and signup password
  final TextEditingController _signupemailcontroller = TextEditingController();

  final TextEditingController _signuppasswordcontroller =
      TextEditingController();

  // signup funtion for creat user
  Future<void> signup() async {
    try {
      await Authentication().signup(_signupemailcontroller.text.trim(),
          _signuppasswordcontroller.text.trim());
      Navigator.pop(context);
      DbFirestore().Adddata('title 1', 'this is title one disciption',
          'https://picsum.photos/300/300?random=1');
      DbFirestore().Adddata('title 2', 'this is title two disciption',
          'https://picsum.photos/300/300?random=2');
      DbFirestore().Adddata('title 2', 'this is title two disciption',
          'https://picsum.photos/300/300?random=3');
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
                  'Sign UP',
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
                controller: _signupemailcontroller,
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
                controller: _signuppasswordcontroller,
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
                      signup();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black12),
                    child: Text(
                      'Sign UP',
                      style: GoogleFonts.rubik(
                        fontSize: 16.sp,
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
                    Text('Have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:
                            Text('login', style: TextStyle(color: Colors.blue)))
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
    _signupemailcontroller.dispose();
    _signuppasswordcontroller.dispose();
    super.dispose();
  }
}
