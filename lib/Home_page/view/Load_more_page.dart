import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_task_app/Home_page/view%20model/Db_firestore.dart';

class LoadMorePage extends StatelessWidget {
  LoadMorePage({super.key});

  // text editingcontrollers text discription and image url
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _discriptioncontroller = TextEditingController();
  TextEditingController _imageurlcontroller = TextEditingController();

  // when the press add button this function will be work
  // this function is pass data like title and etc
  Future<void> _addnoteondatabas() async {
    if (_titlecontroller.text.isNotEmpty) {
      await DbFirestore().Adddata(_titlecontroller.text,
          _discriptioncontroller.text, _imageurlcontroller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            spacing: 20.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titlecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Title'),
              ),
              TextFormField(
                controller: _discriptioncontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Discription'),
              ),
              TextFormField(
                controller: _imageurlcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Imageurl'),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    _addnoteondatabas();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 34.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(child: Text('Add')),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
