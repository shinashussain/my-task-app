import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';
import 'package:my_task_app/Home_page/view/Load_more_page.dart';
import 'package:my_task_app/Home_page/view/SearchDeligation.dart';
import 'package:my_task_app/Home_page/view/list.dart';
import 'package:my_task_app/Home_page/view/test.dart';
import 'package:my_task_app/authentication/viewmodel/authentication.dart';

// this is home page
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  //  refreshing function the page is refreshing then this function will be work
  Future<void> refreshing() async {
    setState(() {
      DbFirestore().getnote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: refreshing,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 46),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: Searchdeligation(),
                          );
                        },
                        child: Container(
                          width: 283,
                          height: 38,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0.r,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20).w,
                            child: Row(
                              spacing: 10.w,
                              children: [
                                Icon(Icons.search),
                                Text(
                                  'search',
                                  style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  width: 85,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SpeechToTextPage()),
                                    );
                                  },
                                  icon: Icon(Icons.mic),
                                  color: Colors.deepOrange,
                                )
                              ],
                            ),
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
                        icon: Icon(Icons.logout_outlined),
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
                ],
              ),
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
