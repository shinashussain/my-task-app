import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeeckRecognitionService {
  final SpeechToText speech = SpeechToText();

  var errors = StreamController<SpeechRecognitionError>();
  var statuses = BehaviorSubject<String>();
  var words = StreamController<SpeechRecognitionResult>();

  var _localeId = '';

  Future<bool> initSpeech() async {
    bool hasSpeech = await speech.initialize(
      onError: errorListener,
      onStatus: statusListener,
    );

    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _localeId = systemLocale!.localeId;
    }

    return hasSpeech;
  }

  void startListening() async {
    print('liserning is started ......................');
    speech.stop();
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(minutes: 1),
        localeId: _localeId,
        onSoundLevelChange: null,
        cancelOnError: true,
        partialResults: true);
  }

  void errorListener(SpeechRecognitionError error) {
    errors.add(error);
  }

  void statusListener(String status) {
    statuses.add(status);
    print('this is statusListener');
    print('$statuses');
  }

  void resultListener(SpeechRecognitionResult result) {
    words.add(result);
    print('this is resultListener');
    print(words);
  }

  void stopListening() {
    print('liserning is stoped');
    speech.stop();
  }

  void cancelListening() {
    speech.cancel();
  }
}
