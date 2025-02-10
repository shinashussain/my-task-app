// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/model/Note.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';
import 'package:my_task_app/Home_page/view/Cardoflost.dart';

class Searchdeligation extends SearchDelegate<Note?> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleSpacing: -10,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.rubik(color: Colors.black45),
            isDense: true,
            contentPadding: EdgeInsets.all(8).r,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.black, width: .5)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.black, width: .5)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: Colors.black, width: .5))));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      SizedBox(
        width: 25.w,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: DbFirestore().SearchResults(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.hasError)
            return Center(
              child: Text('erorr : ${snapshot.error}'),
            );
          if (!snapshot.hasData)
            return Center(
              child: Text('note no fount'),
            );
          final notelist = DbFirestore().getNotes(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: notelist.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                child: Cardoflist(notelist[index]),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
