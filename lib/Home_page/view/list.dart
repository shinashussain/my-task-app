import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/model/Note.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';

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
              return Card_of_list(note);
            },
            itemCount: noteslist.length,
          );
        });
  }
}

// this card is used in home/list
class Card_of_list extends StatelessWidget {
  Note _note;
  Card_of_list(this._note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32).h,
      child: Container(
        width: 331.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0.r,
              ),
            ]),
        child: Row(
          spacing: 11.w,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21).w,
              child: SizedBox(
                height: 70.h,
                child: Container(
                  height: 67.h,
                  width: 67.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      image: DecorationImage(
                        image: AssetImage(_note.imageurl),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 11, top: 17).w.h,
              child: Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _note.title,
                    style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                      width: 207,
                      child: Text(
                        _note.discription,
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
