import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/view/Load_more_page.dart';
import 'package:my_task_app/Home_page/view/list.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';

// this is home page
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 46),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 283,
                      height: 38,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0.r,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // ignorePointers: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'search',
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    IconButton(
                      onPressed: () {
                        Authentication().signOut();
                      },
                      icon: Icon(Icons.account_circle_outlined),
                      iconSize: 35.sp,
                      color: Colors.black54,
                    )
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Items',
                    style: GoogleFonts.rubik(
                        fontSize: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                List(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                    child: Text('secont page'),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return LoadMorePage();
                });
          },
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: Colors.black45,
            child: Icon(Icons.add),
          ),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network('https://picsum.photos/300/300?random=10')),
    );
  }
}
