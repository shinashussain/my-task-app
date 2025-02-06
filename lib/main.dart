import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_task_app/Home_page/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // screeenutilinit is used for responsiblescreen
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // the Home widget is in Home_page folder
            home: Home(),
          );
        });
  }
}
