import 'package:family_expense_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future<void> initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBAd35wF1w6u2yXepsVctmwIGh_uI5Jhbw",
        authDomain: "family-expense-tracker-da485.firebaseapp.com",
        projectId: "family-expense-tracker-da485",
        storageBucket: "family-expense-tracker-da485.appspot.com",
        messagingSenderId: "453487839018",
        appId: "1:453487839018:web:41ed1722fc3d8104284053",
        measurementId: "G-NDCGWX18LC",
      ),
    );
  } else {
    await Firebase.initializeApp(
      name: "family-expense-tracker",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
