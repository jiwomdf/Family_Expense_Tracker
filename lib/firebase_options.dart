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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOAPwZBPmh8yfAAO7wiiLnMTilihhI7fU',
    appId: '1:453487839018:android:59f6b6ce800bba05284053',
    messagingSenderId: '453487839018',
    projectId: 'family-expense-tracker-da485',
    storageBucket: 'family-expense-tracker-da485.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkwNIq88NGnXdHsDiU4WCjfaHVgJ3oj4E',
    appId: '1:453487839018:ios:d3c8cc2be2a4b08e284053',
    messagingSenderId: '453487839018',
    projectId: 'family-expense-tracker-da485',
    storageBucket: 'family-expense-tracker-da485.appspot.com',
    iosBundleId: 'com.programmergabut.familyExpenseTracker',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBAd35wF1w6u2yXepsVctmwIGh_uI5Jhbw',
    appId: '1:453487839018:web:41ed1722fc3d8104284053',
    messagingSenderId: '453487839018',
    projectId: 'family-expense-tracker-da485',
    authDomain: 'family-expense-tracker-da485.firebaseapp.com',
    storageBucket: 'family-expense-tracker-da485.appspot.com',
    measurementId: 'G-NDCGWX18LC',
  );

}