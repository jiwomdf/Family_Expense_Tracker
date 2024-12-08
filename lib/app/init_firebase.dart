import 'package:family_expense_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future<void> initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDKpnH1AMy6jGD9W9Ttiomnw-jOeVrEvf0",
          authDomain: "money-expanse-lidya-s.firebaseapp.com",
          projectId: "money-expanse-lidya-s",
          storageBucket: "money-expanse-lidya-s.appspot.com",
          messagingSenderId: "543633010470",
          appId: "1:543633010470:web:76cbae721c5f7c5937dbe7",
          measurementId: "G-CVGLYJQDQN"),
    );
  } else {
    await Firebase.initializeApp(
      name: "lidya-group-expanses-tracker",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
