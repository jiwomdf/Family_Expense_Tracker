import 'package:core/di/deps_setting_injection.dart' as di_deps_setting;
import 'package:family_expense_tracker/di/bloc_setting_injection.dart'
    as di_bloc_setting;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initAppSettingModule() async {
  await di_deps_setting.init();
  di_bloc_setting.init();
}
