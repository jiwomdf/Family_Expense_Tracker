import 'package:family_expense_tracker/presentation/app/app.dart';
import 'package:family_expense_tracker/presentation/app/init_app_module.dart';
import 'package:family_expense_tracker/presentation/app/init_firebase.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initAppModule();
  //FcmBackgroundHandler().init();
  runApp(const App());
}
