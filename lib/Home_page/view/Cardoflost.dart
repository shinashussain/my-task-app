import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/model/Note.dart';

class Cardoflist extends StatelessWidget {
  Note _note;
  Cardoflist(this._note, {super.key});

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
