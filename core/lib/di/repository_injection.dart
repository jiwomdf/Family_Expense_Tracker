import 'package:core/repository/auth_repository.dart';
import 'package:core/repository/fcm_repository.dart';
import 'package:core/repository/firestore_repository.dart';
import 'package:core/repository/holiday_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepository(firebaseAuth: locator(), authPref: locator()));
  locator.registerLazySingleton<FirestoreRepository>(
      () => FirestoreRepository(firebaseAuth: locator()));
  locator.registerLazySingleton<FcmRepository>(
      () => FcmRepository(client: locator()));
  locator.registerLazySingleton<HolidayRepository>(
      () => HolidayRepository(locator()));
}
