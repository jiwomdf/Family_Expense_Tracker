import 'package:family_expense_tracker/presentation/bloc/setting_firebase/setting_firebase_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => SettingFirebaseBloc(locator()));
}
