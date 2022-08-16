// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB0cMuAEVy-VvjLG61tB1v3YyEOqjxhwls',
    appId: '1:815476620516:web:02025de76490d9d70b00f1',
    messagingSenderId: '815476620516',
    projectId: 'shadows-of-chaos',
    authDomain: 'shadows-of-chaos.firebaseapp.com',
    storageBucket: 'shadows-of-chaos.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3lwUsUVaqi2eNcsRdC_5gP4YaNSA6-5E',
    appId: '1:815476620516:android:986096bc9798571e0b00f1',
    messagingSenderId: '815476620516',
    projectId: 'shadows-of-chaos',
    storageBucket: 'shadows-of-chaos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCt6gM47OqIcQ4tjK6ixW1CWJplC2n4kmE',
    appId: '1:815476620516:ios:16d2649ed74bdcf20b00f1',
    messagingSenderId: '815476620516',
    projectId: 'shadows-of-chaos',
    storageBucket: 'shadows-of-chaos.appspot.com',
    iosClientId: '815476620516-7jlgku4kf1rhklrog9vjtq1mo6gicu5m.apps.googleusercontent.com',
    iosBundleId: 'com.example.shadowsBeta01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCt6gM47OqIcQ4tjK6ixW1CWJplC2n4kmE',
    appId: '1:815476620516:ios:16d2649ed74bdcf20b00f1',
    messagingSenderId: '815476620516',
    projectId: 'shadows-of-chaos',
    storageBucket: 'shadows-of-chaos.appspot.com',
    iosClientId: '815476620516-7jlgku4kf1rhklrog9vjtq1mo6gicu5m.apps.googleusercontent.com',
    iosBundleId: 'com.example.shadowsBeta01',
  );
}
