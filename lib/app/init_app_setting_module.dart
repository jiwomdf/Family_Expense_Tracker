import 'package:core/di/deps_setting_injection.dart' as di_deps_setting;
import 'package:get_it/get_it.dart';
import 'package:group_expense_tracker/di/bloc_setting_injection.dart'
    as di_bloc_setting;

final locator = GetIt.instance;

Future<void> initAppSettingModule() async {
  await di_deps_setting.init();
  di_bloc_setting.init();
}
