// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class Speech extends StatefulWidget {
//   const Speech({Key? key}) : super(key: key);

//   @override
//   _Speechstate createState() => _Speechstate();
// }

// class _Speechstate extends State<_Speechstate> {
//   final TextEditingController _textController = TextEditingController();

//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;
//   String _lastWords = "";

//   @override
//   void initState() {
//     super.initState();
//     if (!_speechEnabled) {
//       _initSpeech();
//     }
//   }

//   /// This has to happen only once per app
//   void _initSpeech() async {
//     _speechEnabled = await _speechToText.initialize();
//   }

//   /// Each time to start a speech recognition session
//   void _startListening() async {
//     await _speechToText.listen(
//       onResult: _onSpeechResult,
//       listenFor: const Duration(seconds: 30),
//       localeId: "en_En",
//       cancelOnError: false,
//       partialResults: false,
//       listenMode: ListenMode.confirmation,
//     );
//     setState(() {});
//   }

//   void _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }

//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       _lastWords = "$_lastWords${result.recognizedWords} ";
//       _textController.text = _lastWords;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//     );
//   }
// }

// // void listenForPermissions() async {
// //     final status = await Permission.microphone.status;
// //     switch (status) {
// //       case PermissionStatus.denied:
// //         requestForPermission();
// //         break;
// //       case PermissionStatus.granted:
// //         break;
// //       case PermissionStatus.limited:
// //         break;
// //       case PermissionStatus.permanentlyDenied:
// //         break;
// //       case PermissionStatus.restricted:
// //         break;
// //       case PermissionStatus.provisional:
// //         throw UnimplementedError();
// //     }
// //   }

//   // Future<void> requestForPermission() async {
//   //   await Permission.microphone.request();
//   // }


// // Scaffold(
// //         body: Center(
// //       child: ListView(
// //         shrinkWrap: true,
// //         padding: const EdgeInsets.all(12),
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Expanded(
// //                 child: TextField(
// //                   controller: _textController,
// //                   minLines: 6,
// //                   maxLines: 10,
// //                   decoration: InputDecoration(
// //                     filled: true,
// //                     fillColor: Colors.grey.shade300,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(
// //                 width: 8,
// //               ),
// //               FloatingActionButton.small(
// //                 onPressed:
// //                     // If not yet listening for speech start, otherwise stop
// //                     _speechToText.isNotListening
// //                         ? _startListening
// //                         : _stopListening,
// //                 tooltip: 'Listen',
// //                 backgroundColor: Colors.blueGrey,
// //                 child: Icon(
// //                     _speechToText.isNotListening ? Icons.mic_off : Icons.mic),
// //               )
// //             ],
// //           ),
// //         ],
// //       ),
// //     ));