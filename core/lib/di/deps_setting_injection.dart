import 'package:core/data/pref/firebase_options_pref.dart';
import 'package:core/util/poultry_registery.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  PoultryRegistry.safeRegister<SharedPreferences>(sharedPreferences);

  PoultryRegistry.safeRegister<FirebaseOptionsPref>(
      FirebaseOptionsPref(prefs: locator()));
}
