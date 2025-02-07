import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 46.h,
              ),
              TextField(
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
                    onPressed: () {},
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
                        onPressed: () {},
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
}
