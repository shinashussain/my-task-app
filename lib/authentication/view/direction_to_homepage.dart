import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_task_app/Home_page/view/Home.dart';
import 'package:my_task_app/authentication/view/login_page.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';

class DirectionToHomepage extends StatelessWidget {
  const DirectionToHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authentication().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Scaffold();
            return const Home();
          } else {
            return Login_page();
          }
        });
  }
}
