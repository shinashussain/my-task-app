import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task_app/Home_page/view/SearchDeligation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class speeck extends StatefulWidget {
  const speeck({super.key});

  @override
  State<speeck> createState() => _speeckState();
}

class _speeckState extends State<speeck> {
  SpeechToText _speechToText = SpeechToText();
  String _lastword = '';
  bool _speechenable = false;

  @override
  void initState() {
    stratlistening();
    if (!_speechenable) {
      _init();
    }
    Timer(Duration(seconds: 5), () {
      if (_lastword != '') {
        showSearch(
            context: context,
            delegate: Searchdeligation(word: _lastword),
            query: _lastword);
      }
    });
    super.initState();
  }

  void _init() async {
    _speechenable = await _speechToText.initialize();
  }

  void stratlistening() async {
    setState(() {
      _lastword = '';
      _speechToText.listen(
        onResult: _speeckresult,
        listenFor: const Duration(seconds: 30),
      );
    });
  }

  void stoplistening() async {
    setState(() {
      _speechToText.stop();
    });
  }

  void _speeckresult(SpeechRecognitionResult result) {
    setState(() {
      _lastword = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 160.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5.h,
            children: [
              GestureDetector(
                  onTap: _speechToText.isListening
                      ? stoplistening
                      : stratlistening,
                  child: _lastword == ''
                      ? CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.mic),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check),
                        )),
              Center(
                child: Text(
                  _lastword,
                  style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void gosearch() async {
    print('this is gosearch 11111111111111');
    await Future.delayed(Duration(seconds: 15)).then((value) {
      showSearch(context: context, delegate: Searchdeligation());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
