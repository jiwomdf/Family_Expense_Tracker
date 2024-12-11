import 'package:core/repository/auth_repository.dart';
import 'package:core/repository/fcm_repository.dart';
import 'package:core/repository/firestore_repository.dart';
import 'package:core/repository/holiday_repository.dart';
import 'package:core/util/poultry_registery.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  PoultryRegistry.safeRegister<AuthRepository>(
      AuthRepository(firebaseAuth: locator(), authPref: locator()));
  PoultryRegistry.safeRegister<FirestoreRepository>(
      FirestoreRepository(firebaseAuth: locator()));
  PoultryRegistry.safeRegister<FcmRepository>(FcmRepository(client: locator()));
  PoultryRegistry.safeRegister<HolidayRepository>(HolidayRepository(locator()));
}
