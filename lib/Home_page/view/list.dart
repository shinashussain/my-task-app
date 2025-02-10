import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/model/Note.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';
import 'package:my_task_app/Home_page/view/Cardoflost.dart';

// this is list class this list is present list
// in home page
class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DbFirestore().stream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SizedBox(
                width: 393,
                height: 250,
                child: Center(child: CircularProgressIndicator()));
          }
          final noteslist = DbFirestore().getNotes(snapshot);
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final note = noteslist[index];
              return Cardoflist(note);
            },
            itemCount: noteslist.length,
          );
        });
  }
}

// this card is used in home/list
