import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/di/bloc_injection.dart' as di;
import 'package:group_expense_tracker/presentation/bloc/setting_firebase/setting_firebase_bloc.dart';
import 'package:group_expense_tracker/presentation/page/setting_firebase/setting_firebase_page.dart';
import 'package:provider/provider.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({super.key});

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SettingFirebaseBloc>()),
      ],
      child: const MaterialApp(home: SettingFirebasePage()),
    );
  }
}
