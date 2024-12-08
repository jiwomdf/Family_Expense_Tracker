import 'package:family_expense_tracker/app/app.dart';
import 'package:family_expense_tracker/app/handle_pwa.dart';
import 'package:family_expense_tracker/app/init_app_module.dart';
import 'package:family_expense_tracker/app/init_firebase.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initAppModule();
  //FcmBackgroundHandler().init();
  await handlePwa();

  runApp(const App());
}
