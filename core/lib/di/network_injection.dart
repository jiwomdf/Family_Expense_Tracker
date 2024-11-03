import 'package:core/data/network/api_service.dart';
import 'package:core/data/network/dio_factory.dart';
import 'package:core/data/network/network_info.dart';
import 'package:core/di/repository_injection.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> init() async {
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  locator.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await locator<DioFactory>().getDio();
  locator.registerLazySingleton<ApiService>(() => ApiService(
        dio, /*locator()*/
      ));
}
