import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// this is list class this list is present list
// in home page
class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card_of_list();
        });
  }
}

// this card is used in home/list
class Card_of_list extends StatelessWidget {
  const Card_of_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
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
            child: Container(
              height: 67,
              width: 67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  image: DecorationImage(
                      image: AssetImage('assets/flutter.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11, top: 17).w.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TItle',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
