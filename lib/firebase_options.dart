// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC02XkAS5Lv2nuN54rrtJPoM8qWqDbmmSk',
    appId: '1:876028504280:web:9eb1009dfa5b97e4d68fad',
    messagingSenderId: '876028504280',
    projectId: 'my-task-app-53e6c',
    authDomain: 'my-task-app-53e6c.firebaseapp.com',
    storageBucket: 'my-task-app-53e6c.firebasestorage.app',
    measurementId: 'G-CDX1ENGH35',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSOy971S5APctozuQzVTLd_h-wvg_Bq50',
    appId: '1:876028504280:android:7535d0e2b882d3ded68fad',
    messagingSenderId: '876028504280',
    projectId: 'my-task-app-53e6c',
    storageBucket: 'my-task-app-53e6c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_MItrjsfIMlIHk3_w7mm0lqwKPbznSj0',
    appId: '1:876028504280:ios:35515c5804fd0f7bd68fad',
    messagingSenderId: '876028504280',
    projectId: 'my-task-app-53e6c',
    storageBucket: 'my-task-app-53e6c.firebasestorage.app',
    iosBundleId: 'com.example.myTaskApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_MItrjsfIMlIHk3_w7mm0lqwKPbznSj0',
    appId: '1:876028504280:ios:35515c5804fd0f7bd68fad',
    messagingSenderId: '876028504280',
    projectId: 'my-task-app-53e6c',
    storageBucket: 'my-task-app-53e6c.firebasestorage.app',
    iosBundleId: 'com.example.myTaskApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC02XkAS5Lv2nuN54rrtJPoM8qWqDbmmSk',
    appId: '1:876028504280:web:a62a30aa2dc13f2dd68fad',
    messagingSenderId: '876028504280',
    projectId: 'my-task-app-53e6c',
    authDomain: 'my-task-app-53e6c.firebaseapp.com',
    storageBucket: 'my-task-app-53e6c.firebasestorage.app',
    measurementId: 'G-ZEMBRKEKC6',
  );
}
