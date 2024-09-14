import 'package:core/data/pref/auth_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AuthPref>(() => AuthPref(prefs: locator()));

  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  locator.registerLazySingleton(() => http.Client());

  /** TODO JIWO 
  locator.registerLazySingleton<Future<SharedPreferences>>(
      () => SharedPreferences.getInstance()); 
  **/

  // @InjectableInit(asExtension: false)
  // Future<void> configureInjection(String env) async {
  //   await $initGetIt(locator, environment: env);
  // }
}
