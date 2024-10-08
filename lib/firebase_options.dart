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
    apiKey: 'enter_your_api_key',
    appId: 'enter_your_app_id',
    messagingSenderId: 'enter_your_messaging_sender_id',
    projectId: 'enter_your_project_id',
    storageBucket: 'enter_your_storage_bucket',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'enter_your_api_key',
    appId: 'enter_your_app_id',
    messagingSenderId: 'enter_your_messaging_sender_id',
    projectId: 'enter_your_project_id',
    storageBucket: 'enter_your_storage_bucket',
    iosBundleId: 'enter_your_measurement_id',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'enter_your_api_key',
    appId: 'enter_your_app_id',
    messagingSenderId: 'enter_your_messaging_sender_id',
    projectId: 'enter_your_project_id',
    authDomain: 'enter_your_auth_domain',
    storageBucket: 'enter_your_storage_bucket',
    measurementId: 'enter_your_measurement_id',
  );
}
